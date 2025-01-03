# Desafio Orietação a Objetos 01

## Criada a classe PromotionProductFilter para indexar os produtos com as promoções validas. Utilizando a class Map<String, Object> para armazer as chaves e valores não repetidos na coleção.
### O metódo containsKey() em um map, é utilizado para verificar se existe a chave informada na coleção.
### O metódo put() em um mao, é utilizado para adicionar um novo valor na coleção.

## Atualizado a classe PromotionService para mapear a classe PromotionProductFilter, onde contém a coleção das PromotionProducts__c.

## Criada a classe Builder PromotionalProductBuilder para construir os produtos promocionais e retornalos.
### O padrão de projeto Builder é utilizado para construir objetos complexos, comumente implementando juntamente o padrão Fluen Interface.

## Criada a classe de teste PromotionServiceTest para testar a classe PromotionService.

## @IsTest(IsParallel=true) Annotation
### Use the @IsTest(IsParallel=true) annotation to indicate test classes that can run in parallel.
### Considerations for the @IsTest(IsParallel=true) annotation
### This annotation forces the test to run in parallel even if the org-wide Disable Parallel Apex Testing option is set.
### @IsTest(SeeAllData=true) and @IsTest(IsParallel=true) annotations can’t be used together on the same Apex method.