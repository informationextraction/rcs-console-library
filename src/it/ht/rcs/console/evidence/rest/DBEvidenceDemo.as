package it.ht.rcs.console.evidence.rest
{
	import it.ht.rcs.console.agent.rest.DBAgentDemo;
	import it.ht.rcs.console.evidence.model.Evidence;
	import it.ht.rcs.console.evidence.model.EvidenceData;
	import it.ht.rcs.console.evidence.model.TypeCount;
	import it.ht.rcs.console.target.rest.DBTargetDemo;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.events.ResultEvent;
	import mx.utils.ObjectUtil;
  

	public class DBEvidenceDemo implements IDBEvidence
	{

		private var filter:Object;
    
    private const SECONDS_PER_DAY:uint = (60 * 60 * 24)

		public static var evidence:ArrayCollection=new ArrayCollection([
      
      // John Doe (SwordFish) a1 desktop, a2 mobile
			new Evidence({_id: 'e01', aid: 'a1', blo: false, da: 1336135607, dr: 1336135607, _mid: 0, note: '', rel: 0, type: 'password', data: new EvidenceData({user: 'pippo', pass: 'alpha', program: 'Mail', service: 'Gmail'})}),
      new Evidence({_id: 'e02', aid: 'a2', blo: true, da: 1309354166, dr: 1309354166, _mid: 0, note: '', rel: 0, type: 'message', data: new EvidenceData({type: 'sms', from: 'local', rcpt: '+393344556', content: 'Hi! How are you?'})}), 
      new Evidence({_id: 'e03', aid: 'a2', blo: false, da: 1309354166, dr: 1309354166, _mid: 0, note: '', rel: 0, type: 'application', data: new EvidenceData({program: 'MobileNotes', action: 'START', desc: ''})}),
      // Alejandro Reade (Swordfish), a3 desktop
      new Evidence({_id: 'e04', aid: 'a3', blo: false, da: 1336135607, dr: 1336135607, _mid: 0, note: '', rel: 0, type: 'keylog', data: new EvidenceData({program: 'Calc', window: 'Calculator', content: '12000+15000'})}),
      new Evidence({_id: 'e05', aid: 'a3', blo: false, da: 1309354166, dr: 1309354166, _mid: 0, note: '', rel: 0, type: 'clipboard', data: new EvidenceData({program: 'Word', window: 'New Document', content: 'The quick brown fox'})}),
      // Joey Fargo (SwordFish), a4 desktop,a5 desktop, a6 mobile
      new Evidence({_id: 'e06', aid: 'a4', blo: false, da: 1309354166, dr: 1309354166, _mid: 0, note: '', rel: 0, type: 'clipboard', data: new EvidenceData({program: 'Word', window: 'New Document', content: 'The quick brown fox'})}),
      new Evidence({_id: 'e07', aid: 'a5', blo: false, da: 1309354166, dr: 1309354166, _mid: 0, note: '', rel: 0, type: 'clipboard', data: new EvidenceData({program: 'Word', window: 'New Document', content: 'The quick brown fox'})}),
      new Evidence({_id: 'e08', aid: 'a6', blo: false, da: 1309354166, dr: 1309354166, _mid: 0, note: '', rel: 0, type: 'clipboard', data: new EvidenceData({program: 'Word', window: 'New Document', content: 'The quick brown fox'})}),
      
      // Guido (Blackjack), a7 desktop ,a8 mobile
      new Evidence({_id: 'e09', aid: 'a7', blo: false, da: 1309354166, dr: 1309354166, _mid: 0, note: '', rel: 0, type: 'clipboard', data: new EvidenceData({program: 'Word', window: 'New Document', content: 'The quick brown fox'})}),
      new Evidence({_id: 'e10', aid: 'a8', blo: false, da: 1309354166, dr: 1309354166, _mid: 0, note: '', rel: 0, type: 'clipboard', data: new EvidenceData({program: 'Word', window: 'New Document', content: 'The quick brown fox'})}),
      new Evidence({_id: 'e11', aid: 'a8', blo: false, da: 1309354166, dr: 1309354166, _mid: 0, note: '', rel: 0, type: 'clipboard', data: new EvidenceData({program: 'Word', window: 'New Document', content: 'The quick brown fox'})}),
      
      // Dmitry Vitaly (All In), a9 mobile
      new Evidence({_id: 'e12', aid: 'a9', blo: false, da: 1309354166, dr: 1309354166, _mid: 0, note: '', rel: 0, type: 'clipboard', data: new EvidenceData({program: 'Word', window: 'New Document', content: 'The quick brown fox'})}),
      new Evidence({_id: 'e13', aid: 'a9', blo: false, da: 1309354166, dr: 1309354166, _mid: 0, note: '', rel: 0, type: 'clipboard', data: new EvidenceData({program: 'Word', window: 'New Document', content: 'The quick brown fox'})}),
      new Evidence({_id: 'e14', aid: 'a9', blo: false, da: 1309354166, dr: 1309354166, _mid: 0, note: '', rel: 0, type: 'clipboard', data: new EvidenceData({program: 'Word', window: 'New Document', content: 'The quick brown fox'})})
			])
      
		public function all(filter:Object, onResult:Function=null, onFault:Function=null):void
		{
			trace(ObjectUtil.toString(filter));
      //agent, target, type, date
      this.filter=filter;
			evidence.filterFunction=filterEvidence;
			evidence.refresh()
			if (onResult != null)
				onResult(new ResultEvent('evidence.all', false, true, evidence));
		}

		private function filterEvidence(item:Object):Boolean
		{
      var result:Boolean=true;
      
      for(var criteria:* in filter)
      {
        if(criteria=="target" && !(DBAgentDemo.getTarget(item.aid)==filter.target)) {result=false; break;}
        if(criteria=="agent" && !(item.aid == filter.agent)) {result=false; break;}
        if(criteria=="type" && !isInArray(item.type, filter.type)) {result=false; break;}
        if(criteria=="blo" && !(item.blo==filter.blo[0])) {result=false; break;}
        if(criteria=="rel" && !isInArray(item.rel, filter.rel)) {result=false; break};
        if(criteria=="aid" && !isInArray(item.aid, filter.aid)) {result=false; break;}
        if(criteria=="date" && !isInDateRange(item, filter)) {result=false; break;}
      }
			return result;
      
		}
    
    private function isInArray(value:*, arr:Array):Boolean
    {
      var result:Boolean;
      for(var i:int=0;i<arr.length;i++)
      {
        if(value==arr[i])
        {
          result=true;
          break;
        }
      }
      return result;
    }
    private function isInDateRange(item:Object, filter:Object):Boolean
    {
      var result:Boolean=false;
      if(filter.date)
      {
        // TODO - How to get the correct actual time?
        var now:uint=uint(new Date().time/1000) ;
        var from:uint;
        var to:Number;
       
          if(filter.from==0 && filter.to==0) {result=true; return result};
          //last 24 hours - default value
          if(!filter.from && !filter.to)
          { 
            from=now-SECONDS_PER_DAY;
            if(item[filter.date]>=from){result=true; return result};
          }
          //from only
          if(filter.from && !filter.to)
          {
            if(item[filter.date]>=filter.from){result=true; return result};
          }
          //to only
          if(!filter.from && filter.to)
          {
            if(item[filter.date]<=filter.to){result=true; return result};
          }
          //from and to
          if(filter.from && filter.to)
          {
            if(item[filter.date]<=filter.to && item[filter.date]>=filter.from){result=true; return result};
          }
      }
      return result;
    }

		public function update(evidence:Evidence, property:Object, target:String, onResult:Function=null, onFault:Function=null):void
		{
		}

		public function destroy(evidence:Evidence, target:String, onResult:Function=null, onFault:Function=null):void
		{
		}

		public function agent_status(params:Object, onResult:Function=null, onFault:Function=null):void
		{
		}

		public function sync_start(params:Object, onResult:Function=null, onFault:Function=null):void
		{
		}

		public function sync_stop(params:Object, onResult:Function=null, onFault:Function=null):void
		{
		}

		public function info(filter:Object, onResult:Function=null, onFault:Function=null):void
		{
		}

		public function commands(filter:Object, onResult:Function=null, onFault:Function=null):void
		{
		}

		public function total(filter:Object, onResult:Function=null, onFault:Function=null):void
		{
      trace("total called")
      var result:ArrayCollection=new ArrayCollection();
      var addressbook:TypeCount=new TypeCount();
      var application:TypeCount=new TypeCount();
      var calendar:TypeCount=new TypeCount();
      var call:TypeCount=new TypeCount();
      var camera:TypeCount=new TypeCount();
      var chat:TypeCount=new TypeCount();
      var clipboard:TypeCount=new TypeCount();
      var device:TypeCount=new TypeCount();
      var file:TypeCount=new TypeCount();
      var keylog:TypeCount=new TypeCount();
      var message:TypeCount=new TypeCount();
      var mic:TypeCount=new TypeCount();
      var mouse:TypeCount=new TypeCount();
      var password:TypeCount=new TypeCount();
      var position:TypeCount=new TypeCount();
      var print:TypeCount=new TypeCount();
      var screenshot:TypeCount=new TypeCount();
      var url:TypeCount=new TypeCount();
      result.source=[addressbook,application,calendar,call,camera,chat,clipboard,device,file,keylog,]
        
      
      if (onResult != null)
        onResult(new ResultEvent('evidence.total', false, true, result));
		}

		public function filesystem(targetId:String, agentId:String, onResult:Function=null, onFault:Function=null):void
		{
		}

		public function show(id:String, target:String, onResult:Function=null, onFault:Function=null):void
		{
		}

	}

}