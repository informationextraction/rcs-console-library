/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - Backdoors.as.
 */

package it.ht.rcs.console.monitor.model
{
import com.adobe.fiber.services.IFiberManagingService;
import com.adobe.fiber.util.FiberUtils;
import com.adobe.fiber.valueobjects.IValueObject;
import flash.events.Event;
import flash.events.EventDispatcher;
import mx.binding.utils.ChangeWatcher;
import mx.collections.ArrayCollection;
import mx.events.PropertyChangeEvent;
import mx.validators.ValidationResult;

import flash.net.registerClassAlias;
import flash.net.getClassByAlias;
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IPropertyIterator;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;

use namespace model_internal;

[ExcludeClass]
public class _Super_Backdoors extends flash.events.EventDispatcher implements com.adobe.fiber.valueobjects.IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void
    {
    }

    model_internal static function initRemoteClassAliasAllRelated() : void
    {
    }

    model_internal var _dminternal_model : _BackdoorsEntityMetadata;
    model_internal var _changedObjects:mx.collections.ArrayCollection = new ArrayCollection();

    public function getChangedObjects() : Array
    {
        _changedObjects.addItemAt(this,0);
        return _changedObjects.source;
    }

    public function clearChangedObjects() : void
    {
        _changedObjects.removeAll();
    }

    /**
     * properties
     */
    private var _internal_symbian : Boolean;
    private var _internal_blackberry : Boolean;
    private var _internal_osx : Boolean;
    private var _internal_total : Object;
    private var _internal_android : Boolean;
    private var _internal_ios : Boolean;
    private var _internal_desktop : Object;
    private var _internal_windows : Boolean;
    private var _internal_winmo : Boolean;
    private var _internal_linux : Boolean;
    private var _internal_mobile : Object;

    private static var emptyArray:Array = new Array();


    /**
     * derived property cache initialization
     */
    model_internal var _cacheInitialized_isValid:Boolean = false;

    model_internal var _changeWatcherArray:Array = new Array();

    public function _Super_Backdoors()
    {
        _model = new _BackdoorsEntityMetadata(this);

        // Bind to own data or source properties for cache invalidation triggering
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "total", model_internal::setterListenerTotal));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "desktop", model_internal::setterListenerDesktop));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "mobile", model_internal::setterListenerMobile));

    }

    /**
     * data/source property getters
     */

    [Bindable(event="propertyChange")]
    public function get symbian() : Boolean
    {
        return _internal_symbian;
    }

    [Bindable(event="propertyChange")]
    public function get blackberry() : Boolean
    {
        return _internal_blackberry;
    }

    [Bindable(event="propertyChange")]
    public function get osx() : Boolean
    {
        return _internal_osx;
    }

    [Bindable(event="propertyChange")]
    public function get total() : Object
    {
        return _internal_total;
    }

    [Bindable(event="propertyChange")]
    public function get android() : Boolean
    {
        return _internal_android;
    }

    [Bindable(event="propertyChange")]
    public function get ios() : Boolean
    {
        return _internal_ios;
    }

    [Bindable(event="propertyChange")]
    public function get desktop() : Object
    {
        return _internal_desktop;
    }

    [Bindable(event="propertyChange")]
    public function get windows() : Boolean
    {
        return _internal_windows;
    }

    [Bindable(event="propertyChange")]
    public function get winmo() : Boolean
    {
        return _internal_winmo;
    }

    [Bindable(event="propertyChange")]
    public function get linux() : Boolean
    {
        return _internal_linux;
    }

    [Bindable(event="propertyChange")]
    public function get mobile() : Object
    {
        return _internal_mobile;
    }

    public function clearAssociations() : void
    {
    }

    /**
     * data/source property setters
     */

    public function set symbian(value:Boolean) : void
    {
        var oldValue:Boolean = _internal_symbian;
        if (oldValue !== value)
        {
            _internal_symbian = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "symbian", oldValue, _internal_symbian));
        }
    }

    public function set blackberry(value:Boolean) : void
    {
        var oldValue:Boolean = _internal_blackberry;
        if (oldValue !== value)
        {
            _internal_blackberry = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "blackberry", oldValue, _internal_blackberry));
        }
    }

    public function set osx(value:Boolean) : void
    {
        var oldValue:Boolean = _internal_osx;
        if (oldValue !== value)
        {
            _internal_osx = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "osx", oldValue, _internal_osx));
        }
    }

    public function set total(value:Object) : void
    {
        var oldValue:Object = _internal_total;
        if (oldValue !== value)
        {
            _internal_total = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "total", oldValue, _internal_total));
        }
    }

    public function set android(value:Boolean) : void
    {
        var oldValue:Boolean = _internal_android;
        if (oldValue !== value)
        {
            _internal_android = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "android", oldValue, _internal_android));
        }
    }

    public function set ios(value:Boolean) : void
    {
        var oldValue:Boolean = _internal_ios;
        if (oldValue !== value)
        {
            _internal_ios = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "ios", oldValue, _internal_ios));
        }
    }

    public function set desktop(value:Object) : void
    {
        var oldValue:Object = _internal_desktop;
        if (oldValue !== value)
        {
            _internal_desktop = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "desktop", oldValue, _internal_desktop));
        }
    }

    public function set windows(value:Boolean) : void
    {
        var oldValue:Boolean = _internal_windows;
        if (oldValue !== value)
        {
            _internal_windows = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "windows", oldValue, _internal_windows));
        }
    }

    public function set winmo(value:Boolean) : void
    {
        var oldValue:Boolean = _internal_winmo;
        if (oldValue !== value)
        {
            _internal_winmo = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "winmo", oldValue, _internal_winmo));
        }
    }

    public function set linux(value:Boolean) : void
    {
        var oldValue:Boolean = _internal_linux;
        if (oldValue !== value)
        {
            _internal_linux = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "linux", oldValue, _internal_linux));
        }
    }

    public function set mobile(value:Object) : void
    {
        var oldValue:Object = _internal_mobile;
        if (oldValue !== value)
        {
            _internal_mobile = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "mobile", oldValue, _internal_mobile));
        }
    }

    /**
     * Data/source property setter listeners
     *
     * Each data property whose value affects other properties or the validity of the entity
     * needs to invalidate all previously calculated artifacts. These include:
     *  - any derived properties or constraints that reference the given data property.
     *  - any availability guards (variant expressions) that reference the given data property.
     *  - any style validations, message tokens or guards that reference the given data property.
     *  - the validity of the property (and the containing entity) if the given data property has a length restriction.
     *  - the validity of the property (and the containing entity) if the given data property is required.
     */

    model_internal function setterListenerTotal(value:flash.events.Event):void
    {
        _model.invalidateDependentOnTotal();
    }

    model_internal function setterListenerDesktop(value:flash.events.Event):void
    {
        _model.invalidateDependentOnDesktop();
    }

    model_internal function setterListenerMobile(value:flash.events.Event):void
    {
        _model.invalidateDependentOnMobile();
    }


    /**
     * valid related derived properties
     */
    model_internal var _isValid : Boolean;
    model_internal var _invalidConstraints:Array = new Array();
    model_internal var _validationFailureMessages:Array = new Array();

    /**
     * derived property calculators
     */

    /**
     * isValid calculator
     */
    model_internal function calculateIsValid():Boolean
    {
        var violatedConsts:Array = new Array();
        var validationFailureMessages:Array = new Array();

        var propertyValidity:Boolean = true;
        if (!_model.totalIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_totalValidationFailureMessages);
        }
        if (!_model.desktopIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_desktopValidationFailureMessages);
        }
        if (!_model.mobileIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_mobileValidationFailureMessages);
        }

        model_internal::_cacheInitialized_isValid = true;
        model_internal::invalidConstraints_der = violatedConsts;
        model_internal::validationFailureMessages_der = validationFailureMessages;
        return violatedConsts.length == 0 && propertyValidity;
    }

    /**
     * derived property setters
     */

    model_internal function set isValid_der(value:Boolean) : void
    {
        var oldValue:Boolean = model_internal::_isValid;
        if (oldValue !== value)
        {
            model_internal::_isValid = value;
            _model.model_internal::fireChangeEvent("isValid", oldValue, model_internal::_isValid);
        }
    }

    /**
     * derived property getters
     */

    [Transient]
    [Bindable(event="propertyChange")]
    public function get _model() : _BackdoorsEntityMetadata
    {
        return model_internal::_dminternal_model;
    }

    public function set _model(value : _BackdoorsEntityMetadata) : void
    {
        var oldValue : _BackdoorsEntityMetadata = model_internal::_dminternal_model;
        if (oldValue !== value)
        {
            model_internal::_dminternal_model = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "_model", oldValue, model_internal::_dminternal_model));
        }
    }

    /**
     * methods
     */


    /**
     *  services
     */
    private var _managingService:com.adobe.fiber.services.IFiberManagingService;

    public function set managingService(managingService:com.adobe.fiber.services.IFiberManagingService):void
    {
        _managingService = managingService;
    }

    model_internal function set invalidConstraints_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_invalidConstraints;
        // avoid firing the event when old and new value are different empty arrays
        if (oldValue !== value && (oldValue.length > 0 || value.length > 0))
        {
            model_internal::_invalidConstraints = value;
            _model.model_internal::fireChangeEvent("invalidConstraints", oldValue, model_internal::_invalidConstraints);
        }
    }

    model_internal function set validationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_validationFailureMessages;
        // avoid firing the event when old and new value are different empty arrays
        if (oldValue !== value && (oldValue.length > 0 || value.length > 0))
        {
            model_internal::_validationFailureMessages = value;
            _model.model_internal::fireChangeEvent("validationFailureMessages", oldValue, model_internal::_validationFailureMessages);
        }
    }

    model_internal var _doValidationCacheOfTotal : Array = null;
    model_internal var _doValidationLastValOfTotal : Object;

    model_internal function _doValidationForTotal(valueIn:Object):Array
    {
        var value : Object = valueIn as Object;

        if (model_internal::_doValidationCacheOfTotal != null && model_internal::_doValidationLastValOfTotal == value)
           return model_internal::_doValidationCacheOfTotal ;

        _model.model_internal::_totalIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isTotalAvailable && _internal_total == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "total is required"));
        }

        model_internal::_doValidationCacheOfTotal = validationFailures;
        model_internal::_doValidationLastValOfTotal = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfDesktop : Array = null;
    model_internal var _doValidationLastValOfDesktop : Object;

    model_internal function _doValidationForDesktop(valueIn:Object):Array
    {
        var value : Object = valueIn as Object;

        if (model_internal::_doValidationCacheOfDesktop != null && model_internal::_doValidationLastValOfDesktop == value)
           return model_internal::_doValidationCacheOfDesktop ;

        _model.model_internal::_desktopIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isDesktopAvailable && _internal_desktop == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "desktop is required"));
        }

        model_internal::_doValidationCacheOfDesktop = validationFailures;
        model_internal::_doValidationLastValOfDesktop = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfMobile : Array = null;
    model_internal var _doValidationLastValOfMobile : Object;

    model_internal function _doValidationForMobile(valueIn:Object):Array
    {
        var value : Object = valueIn as Object;

        if (model_internal::_doValidationCacheOfMobile != null && model_internal::_doValidationLastValOfMobile == value)
           return model_internal::_doValidationCacheOfMobile ;

        _model.model_internal::_mobileIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isMobileAvailable && _internal_mobile == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "mobile is required"));
        }

        model_internal::_doValidationCacheOfMobile = validationFailures;
        model_internal::_doValidationLastValOfMobile = value;

        return validationFailures;
    }
    

}

}
