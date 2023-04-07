trigger sourceText on Contact (after insert) {
    List<Contact> contacts = [SELECT Id, Name, Is_External__c FROM Contact WHERE Id IN :trigger.new];
        for(Contact c : contacts){
            if(c.Is_External__c == True){
                c.Source__c = 'Imported external contacts';
            }
            else{
                c.Source__c = 'Imported internal contacts';
            }
        }
    if(contacts.size()>0){
        System.debug(contacts.size());
        UPDATE contacts;
    }
}