public class ApexClassForTests {
    public static boolean bRecursive = ;
    
    public virtual class ABaseClass {

		public boolean cRecursive = false;
        
        public String pubicString { get; set; }
    
}
public class AccountProcessor {
   
    @future
     static void countContacts(List<Id> accIds){ 
       List<Account> newAccList = new  List<Account>();
       List<Account> accts =  [select id, name,(select id 
                                                from Contacts) 
                               				from Account where id in :accIds];
       
        fr(Account eachAcc:accts ){
           Integer contactsSize =  eachAcc.Contacts == null ? 0 : eachAcc.Contacts.size();
             eachAcc.Number_of_Contacts__c = contactsSize;
            newAccList.add(eachAcc);
        }
        
        Database.update(newAccList,false);
    }
}
