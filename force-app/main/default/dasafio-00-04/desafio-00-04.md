# Capturar Leads e Clientes através das Doações

### Esse desafio o fará pensar em qual é comportamento comum e qual é sua variabilidade, utilizando os conceitos de Herança e polimorfismo.​

## Contexto de negócio

### Sou um grande Influencer e estou utilizando a Plataforma Salesforce para identificar e classificar tanto os Leads quanto os Clientes.

## Recentemente iniciei uma nova campanha filantrópica, onde recebo centenas de doações, por meio de uma Plataforma de Pagamento On-line. Então gostaria de identificar e classificar essas doações na Plataforma Salesforce.

## Segue uma lista das minhas necessidades.

### Converter um Lead para Conta, com base no doador de um Lead já existente.
### riar um Lead para os doadores não cadastrados.
### Criar Oportunidade para a doação, atrelado ao doador Conta.
 
## Mapeamento do Account
### Segue abaixo o mapeamento para o objeto Account com base na classe PaymentCallbackInbound

Destino	Transformação	Origem

DocumentNumber__c	 	payer.document       
Name             	 	payer.name           
AccountSource    	    Campanha DevBuilder	                     
BillingStreet    	 	payer.billing.street 
BillingCity      	 	payer.billing.city   
BillingState     	 	payer.billing.state  
BillingPostalCode	 	payer.billing.zipCode
BillingCountry   	 	payer.billing.country
  

## Mapeamento da Oportunidade

### Segue abaixo o mapeamento para o objeto Opportunity com base na classe PaymentCallbackInbound

Destino	Transformação	Origem

AccountId	 	       account.Id
Name             	   Campanha DevBuilder + ‘ : ‘ + payer.name	payer.name
Pricebook2Id    	   Pesquisar o Pricebook2 com o nome igual à “Campanha DevBuilder”	Pricebook2.Id
CloseDate 	           Data corrente	 
StageName 	           Closed Won	 
LeadSource	           Campanha DevBuilder	 
 