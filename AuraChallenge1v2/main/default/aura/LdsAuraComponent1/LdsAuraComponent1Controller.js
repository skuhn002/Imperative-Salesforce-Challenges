({
    init : function(component, event, helper) {
        component.set('v.columns', [
            { label: 'Account Name', fieldName: 'Name', type: 'text'},
            { label: 'Industry', fieldName: 'Industry', type: 'text'},
            { label: 'Annual Revenue', fieldName: 'AnnualRevenue', type: 'currency'}
        ]);
        helper.getData(component);
    },

    handleCreateAccount : function(component, event, helper){
        helper.getData(component);
    }
})
