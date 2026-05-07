# Módulo: search

## Objetivo da função

O módulo exporta a função `searchProducts` que realiza uma busca simples por nome
de produto. A busca é case-insensitive e retorna produtos cujo campo `name`
contém o termo informado (substring match).

## Parâmetros

- `products` (Array<Object>): lista de objetos produto. Cada objeto deve possuir
  a propriedade `name` do tipo `string`. Ex.: `{ id: 1, name: 'Camiseta' }`.
- `query` (string): termo de busca. A comparação é feita com `toLowerCase()` para
  desconsiderar diferenças de maiúsculas/minúsculas.

## Retorno

Retorna um `Array<Object>` contendo os produtos que satisfazem a condição de
busca (produto cujo `name` contém `query`).

## Exemplo de uso

```js
const searchProducts = require('../src/search');

const products = [
  { id: 1, name: 'Camiseta Azul' },
  { id: 2, name: 'Calça Jeans' },
  { id: 3, name: 'Camisa Social' }
];

const resultados = searchProducts(products, 'camiseta');
console.log(resultados);
// => [{ id: 1, name: 'Camiseta Azul' }]
```

## Limitações

- A função pressupõe que `products` seja um array e que cada `product.name` seja
  uma string; caso contrário, ela pode lançar um erro.
- A busca é por substring simples e não realiza normalização de acentos
  (diacríticos) nem corresponde parcialmente com tolerância a erros (fuzzy).
- Não pesquisa em outras propriedades (categoria, descrição, tags). Se precisar
  de buscas mais avançadas, considere indexação ou uso de bibliotecas de busca.
- Complexidade linear O(n) em relação ao número de produtos — para catálogos
  muito grandes, avalie técnicas de indexação e paginação.

## Implementação

Referência: `src/search.js`
