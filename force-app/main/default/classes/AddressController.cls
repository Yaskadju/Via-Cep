public class AddressController {

    @AuraEnabled
    public static AddressResult getAddress(String postalCode) 
    {
        AddressResult address = new AddressResult();
        
        address = new AddressAPIService().searchAddressByPostalCode(postalCode);

        return address;
    }

    @AuraEnabled 
    public static void saveAddress(Id accountId, AddressResult address) 
    {
        //TODO: Write the code to save the address to this account id
        
        Account varAccount = [SELECT Id, Name FROM Account WHERE Id = :accountId LIMIT 1];

        varAccount.ShippingStreet = address.logradouro;
        varAccount.ShippingState = address.uf;
        varAccount.ShippingCity = address.localidade;
        
        update varAccount;
    }
}