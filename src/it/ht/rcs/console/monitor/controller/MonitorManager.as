package it.ht.rcs.console.monitor.controller
{
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import it.ht.rcs.console.DB;
	import it.ht.rcs.console.controller.ItemManager;
	import it.ht.rcs.console.events.RefreshEvent;
	import it.ht.rcs.console.events.SessionEvent;
	import it.ht.rcs.console.monitor.model.Status;
	import it.ht.rcs.console.push.PushController;
	import it.ht.rcs.console.push.PushEvent;
	
	import mx.core.FlexGlobals;
	import mx.events.PropertyChangeEvent;
	import mx.rpc.events.ResultEvent;

  public class MonitorManager extends ItemManager
  {
    
    public function MonitorManager() { super(Status); }
    
    private static var _instance:MonitorManager = new MonitorManager();
    public static function get instance():MonitorManager { return _instance; }
    
    private var autoRefresh:Timer = new Timer(30000);

    public function startAutorefresh():void
    {
      PushController.instance.addEventListener(PushEvent.MONITOR, onAutorefresh);
      autoRefresh.addEventListener(TimerEvent.TIMER, onAutorefresh);
      autoRefresh.start();
      refresh();
    }

    public function stopAutorefresh():void
    {
      PushController.instance.removeEventListener(PushEvent.MONITOR, onAutorefresh);
      autoRefresh.removeEventListener(TimerEvent.TIMER, onAutorefresh);
      autoRefresh.stop();
    }
    
    public function onAutorefresh(e:*):void
    {
      refresh();
    }
    
    override public function refresh():void
    {
      super.refresh();
      DB.instance.monitor.all(onResult);
    }
    
    private function onResult(e:ResultEvent):void
    {
      clear();
      for each (var item:* in e.result.source)
        addItem(item);
      dispatchDataLoadedEvent();
    }
    
    override protected function onItemRemove(o:*):void 
    {
      // refresh the counters after deletion
      DB.instance.monitor.destroy(o._id, onMonitorEvent);
    }
    
    override protected function onLogout(e:SessionEvent):void
    {
      super.onLogout(e);
      stopCounters();
    }
    
    public function getStatusByAddress(address:String):Status
    {
      if (address == null)
        return null;
      
      for each (var o:* in _items.source)
      if (o.address == address)
        return o;
      return null;
    }
    
    private var _monitorCounter:Object = {value: NaN, style: 'info'};
    
    public function startCounters():void
    {
      FlexGlobals.topLevelApplication.addEventListener(RefreshEvent.REFRESH, onMonitorEvent);
      PushController.instance.addEventListener(PushEvent.MONITOR, onMonitorEvent);
      
      /* the first refresh */
      onMonitorEvent(null);
    }

    public function stopCounters():void
    {
      FlexGlobals.topLevelApplication.removeEventListener(RefreshEvent.REFRESH, onMonitorEvent);
      PushController.instance.removeEventListener(PushEvent.MONITOR, onMonitorEvent);
    }
    
    private function onMonitorEvent(e:Event):void
    {
      DB.instance.monitor.counters(onMonitorCountersResult);
      refresh();
    }
    
    private function onMonitorCountersResult(e:ResultEvent):void
    {
      var error:int = e.result.error as int;
      var warn:int = e.result.warn as int;
      
      if (error > 0) {
        _monitorCounter.value = error;
        _monitorCounter.style = 'alert';
      } else if (warn > 0) {
        _monitorCounter.value = warn;
        _monitorCounter.style = 'warn';
      } else {
        _monitorCounter.value = null;
      }

      dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, 'monitorCounter', null, _monitorCounter));
    }
    
    [Bindable(event='propertyChange')]
    public function get monitorCounter():Object
    {
      return _monitorCounter;
    }
        
  }
  
}