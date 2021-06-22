public class AddressAPIService {

    public AddressResult searchAddressByPostalCode(String postalCode) {

        //TODO: Complete this call to viacep endpoint 

        AddressResult address = new AddressResult();


        Http http = new Http();
        HttpRequest request = new HttpRequest();
        HttpResponse response = new HttpResponse();

        request.setMethod('GET');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setEndpoint('https://viacep.com.br/ws/' + postalCode + '/json/');
        
        response = http.send(request);

        if(response.getStatusCode() == 200)
        {   
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            
            address.localidade = (String) results.get('localidade');
            address.logradouro = (String) results.get('logradouro');
            address.cep = (String) results.get('cep');
            address.uf = (String) results.get('uf');

            System.debug(address);

            return address;
        } 

        return null;
    }
}