/*
 * Programa: Loja de Peixes
 * Objetivo: Calcular o valor total da compra conforme a quantidade de peixes.
 * Estrutura utilizada: decisão (if / else if / else)
 */

#include <stdio.h>
#include <locale.h>

int main() {
    setlocale(LC_ALL, "Portuguese");

    int quantidadePeixes;
    float valorPorPeixe, valorTotal;

    printf("=== Seja bem-vindo(a) à Pedro Peixes ===\n");

    printf("\n=== Promoção do Dia ===\n");
    printf("Até 4 peixes .......... R$ 8,00 cada\n");
    printf("De 5 a 9 peixes ....... R$ 6,50 cada\n");
    printf("De 10 a 100 peixes .... R$ 5,00 cada\n");

    printf("\nQual a quantidade de peixes que deseja comprar?\n");
    printf("Digite: ");
    scanf("%d", &quantidadePeixes);

    if (quantidadePeixes < 5) {
        valorPorPeixe = 8.00;
    } 
    else if (quantidadePeixes < 10) {
        valorPorPeixe = 6.50;
    } 
    else if (quantidadePeixes <= 100) {
        valorPorPeixe = 5.00;
    } 
    else {
        printf("\nQuantidade acima do limite permitido.\n");
        return 1;
    }

    valorTotal = quantidadePeixes * valorPorPeixe;

    printf("\n=== RESUMO DA COMPRA ===\n");
    printf("Quantidade de peixes: %d\n", quantidadePeixes);
    printf("Valor por peixe: R$ %.2f\n", valorPorPeixe);
    printf("Valor total da compra: R$ %.2f\n", valorTotal);

    return 0;
}
