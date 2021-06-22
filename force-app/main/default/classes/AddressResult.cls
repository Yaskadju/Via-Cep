public class AddressResult {
    
    @AuraEnabled
    public String cep {get;set;}
    
    @AuraEnabled
    public String logradouro {get;set;}
    
    @AuraEnabled
    public String numero {get;set;}
    
    @AuraEnabled 
    public String localidade {get;set;}
    
    @AuraEnabled
    public String uf {get;set;}
    
    @AuraEnabled
    public Boolean erro {get;set;}
    
}