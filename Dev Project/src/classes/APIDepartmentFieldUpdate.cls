Public Class APIDepartmentFieldUpdate
{


Id caseId= Schema.SObjectType.Case.getRecordTypeInfosByName().get('API').getRecordTypeId();

Public void getFieldUpdate(List<Case> c,Map<Id,Case> oldMap)
{
                
                              
                  set<string> Quenames=new set<string>();
                  set<id> Queids=new set<id>();
                  Quenames.add('API Analyst Queue');
                  Quenames.add('API Inside Sales Queue');
                   Quenames.add('API Core Engineering Queue');
                   Quenames.add('API RHO MSA Queue');
                  Quenames.add('API Services Engineering Queue');
                  Quenames.add('API Services Queue');
                                 
                  List<Group> qId = [select id,name from Group where type='Queue' AND Name in :Quenames];
                 

   for(Case cas:c){
          for(Group G:qId){
           
        if(cas.RecordTypeId==caseId && cas.API_Department__c!=oldMap.get(cas.Id).API_Department__c &&cas.API_Department__c!=null){
                 
            if(cas.API_Department__c=='Analysts' && G.Name=='API Analyst Queue'){
                  
             cas.ownerId=G.Id;
                       
            }
 else if(cas.API_Department__c=='Inside Sales'&& G.Name=='API Inside Sales Queue'){
  
           
            cas.ownerId=G.Id;


}
else if(cas.API_Department__c=='Core Engineering'&& G.Name=='API Core Engineering Queue'){
  
           
            cas.ownerId=G.Id;


}
else if(cas.API_Department__c=='RHO MSA'&& G.Name=='API RHO MSA Queue'){
  
           
            cas.ownerId=G.Id;

}
else if(cas.API_Department__c=='Services Engineering'&& G.Name=='API Services Engineering Queue'){
  
             cas.ownerId=G.Id;


}
else if(cas.API_Department__c=='Services'&& G.Name=='API Services Queue'){
  
             cas.ownerId=G.Id;


}

}
}
}
}
}