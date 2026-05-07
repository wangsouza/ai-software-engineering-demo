/**
 * Busca produtos por nome (case-insensitive, substring match).
 *
 * Objetivo:
 * Retornar os itens do array `products` cujo campo `name` contém o termo
 * `query`, comparando em minúsculas para realizar uma busca case-insensitive.
 *
 * @param {Array<Object>} products - Array de objetos produto. Cada objeto deve
 *   expor a propriedade `name` do tipo string. Ex.: { id: 1, name: 'Camiseta' }
 * @param {string} query - Termo de busca (string). A busca é feita por substring
 *   (contains) de forma case-insensitive.
 * @returns {Array<Object>} - Array com os produtos que combinam com o termo.
 *
 * Exemplo de uso:
 * ```js
 * const products = [
 *   { id: 1, name: 'Camiseta Azul' },
 *   { id: 2, name: 'Calça Jeans' }
 * ];
 * const results = searchProducts(products, 'camiseta');
 * // results => [{ id: 1, name: 'Camiseta Azul' }]
 * ```
 *
 * Limitações e observações:
 * - A função assume que `products` é um array e que cada `product.name` é uma
 *   string; se esse contrato não for respeitado, a função lançará um erro.
 * - A comparação usa `toLowerCase()` — não há normalização de acentuação/diacríticos
 *   nem suporte a fuzzy matching (apenas substring exata ignorando case).
 * - Não pesquisa em outros campos (ex.: categoria, descrição). Para esses casos,
 *   adapte a função ou implemente um índice de busca.
 * - Complexidade: O(n) em relação ao número de produtos.
 */
function searchProducts(products, query) {
  return products.filter(product =>
    product.name.toLowerCase().includes(query.toLowerCase())
  );
}

module.exports = searchProducts;
