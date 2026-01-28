/*
 * Programa: Lanchonete
 * Objetivo: Calcular o valor total da compra de lanches e bebidas de acordo com o código escolhido e a quantidade informada pelo usuário.
 * Estrutura utilizada: decisão (switch-case)
 */
#include <stdio.h>
#include <stdlib.h>
#include <locale.h>

//Função para calcular o valor do lanche
float calcularLanche(int codigo, int quantidade) {
    switch (codigo) {
        case 1100: return 10.00f * quantidade;
        case 1210: return 17.00f * quantidade;
        case 1305: return 23.00f * quantidade;
        case 1307: return 27.50f * quantidade;
        default:   return -1.0f; // código inválido
    }
}

//Função para calcular o valor da bebida
float calcularBebida(int codigo, int quantidade) {
    switch (codigo) {
        case 12: return 5.00f * quantidade;
        case 13: return 3.00f * quantidade;
        case 14: return 5.00f * quantidade;
        case 15: return 4.50f * quantidade;
        case 16: return 4.00f * quantidade;
        default: return -1.0f; // código inválido
    }
}

int main() {
    setlocale(LC_ALL, "Portuguese");

    int codigoLanche, qtdLanche;
    int codigoBebida, qtdBebida;
    float valorLanche, valorBebida, valorTotal;

    printf("=== PROGRAMA LANCHONETE ===\n\n");

    printf("Cardápio de Lanches:\n");
    printf("1100 - Hot Dog ........ R$ 10,00\n");
    printf("1210 - X-Burguer ...... R$ 17,00\n");
    printf("1305 - X-Salada ....... R$ 23,00\n");
    printf("1307 - X-Salada Bacon . R$ 27,50\n");

    printf("\nDigite o código do lanche: ");
    scanf("%d", &codigoLanche);

    printf("Digite a quantidade: ");
    scanf("%d", &qtdLanche);

    valorLanche = calcularLanche(codigoLanche, qtdLanche);

    if (valorLanche < 0) {
        printf("\nCódigo de lanche inválido.\n");
        return 1;
    }

    printf("Valor do lanche: R$ %.2f\n\n", valorLanche);

    printf("Cardápio de Bebidas:\n");
    printf("12 - Coca Lata ........ R$ 5,00\n");
    printf("13 - Coca KS .......... R$ 3,00\n");
    printf("14 - Fanta Guaraná .... R$ 5,00\n");
    printf("15 - Fanta Uva ........ R$ 4,50\n");
    printf("16 - Cotuba Lata ...... R$ 4,00\n");

    printf("\nDigite o código da bebida: ");
    scanf("%d", &codigoBebida);

    printf("Digite a quantidade: ");
    scanf("%d", &qtdBebida);

    valorBebida = calcularBebida(codigoBebida, qtdBebida);

    if (valorBebida < 0) {
        printf("\nCódigo de bebida inválido.\n");
        return 1;
    }

    printf("Valor da bebida: R$ %.2f\n\n", valorBebida);

    valorTotal = valorLanche + valorBebida;

    printf("================================\n");
    printf("VALOR TOTAL A PAGAR: R$ %.2f\n", valorTotal);
    printf("================================\n");

    return 0;
}