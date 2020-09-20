// Classe: Classe che contiene il webservice oggetto del task
// Autore: Lanzarotti Valentino
// Data: 29/01/2018

global class taskAuto { 
    // metodo che dato una targa,restituisce una lista dei valori trovati:
	webservice static  string GetVeicoloInfo(string targaAuto){
     List<car__c> RicercAuto = new List<car__c>();
     string MacchinaTrovata;
     // Verifica dei dati passati:
     if(targaAuto==NULL || targaAuto.length()>7 || targaAuto.length()<7) {
     // Generazione errore:
      return 'Errore di inserimento della targa,riprovare';
     }
     else
     {
     // Se il parametro passato è corretto viene efftuata laa Ricerca del veicolo:
     RicercAuto = [SELECT Name,Cilindrata__c,Modello__C from car__c WHERE  Targa__c = :targaAuto];
     // Ritorna modello e cilindrata
     //return 'Nome casa automobilistica: '+ RicercAuto.Name + '\n\t\t\t ' + 'Modello: '+ RicercAuto.modello__c + 'Cilindrata : ' + RicercAuto.Cilindrata__c ;
     return 'Nome casa automobilistica: '+ RicercAuto.get(1) + '\n\t\t\t ' + 'Modello: '+ RicercAuto.get(2) + 'Cilindrata : ' + RicercAuto.get(3); 
     }
    return 'Ricerca eseguita' ;  
   }
    
   // Metodo per aggiornare i dati di un veicolo:
   webservice static string SetVeicolo(string targaAuto,integer cil){
   List<car__c> RicercAuto = new List<car__c>();
   // Controllo sui dati se la targa immessa è corretta:
   if((targaAuto==NULL || targaAuto.length()>7 || targaAuto.length()<7) && cil>0) {
   // Generazione errore:
      return 'Errore di inserimento della targa,riprovare';
    }
    else
    {
     // Se il parametro passato è corretto viene efftuata laa Ricerca del veicolo:
      RicercAuto = [SELECT Name,Cilindrata__c,Modello__C from car__c WHERE  Targa__c = :targaAuto];
     // Viene effettuato un aggiornamento dei dati:
     RicercAuto.Cilindrata__c = cil;
     update RicercAuto;      
    }
    return 'Errore di inserimento della targa,riprovare';   
   }
}