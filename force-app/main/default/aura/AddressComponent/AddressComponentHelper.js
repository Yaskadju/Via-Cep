({
    searchAddress : function(component){

        const action = component.get('c.getAddress');
        
        action.setParams({
            postalCode : component.get('v.postalCode')
        });

        action.setCallback(this, function(response) {
            //TODO: get the response from controller and load the address on html

            var state = response.getState();
            if (state === 'SUCCESS')
            {
                component.set("v.address", response.getReturnValue());
            }

        });

        $A.enqueueAction(action);        
    },

    saveAddress : function(component){

        var action = component.get('c.saveAddress');
        
        action.setParams({
            accountId : component.get('v.recordId'),
            address : component.get('v.address')
        });

        action.setCallback(this, function (response) {
            //TODO: Save the address in this account

            var state = response.getState()
            if (state === 'SUCCESS')
            {
                var res = response.getReturnValue()
                component.set('v.RegForm', res)
            }
        });

        $A.enqueueAction(action);        
    },

})