/*
 * Programa: Padaria / Confeitaria
 * Objetivo: Calcular o valor total da compra de doces conforme o tipo selecionado e a quantidade em quilogramas.
 * Estrutura utilizada: decisão (switch-case)
 */

#include <stdio.h>
#include <string.h>
#include <locale.h>

//Função para definir o valor por KG do doce
float obterValorPorKG(int tipoDoce, float kg) {
    switch (tipoDoce) {
        case 1: return (kg <= 5) ? 25.00f : 22.00f;
        case 2: return (kg <= 5) ? 24.45f : 22.25f;
        case 3: return (kg <= 5) ? 35.00f : 30.00f;
        case 4: return (kg <= 5) ? 38.50f : 36.20f;
        default: return -1.0f;
    }
}

//Função para mostrar o nome do doce
void mostrarNomeDoce(int tipoDoce) {
    switch (tipoDoce) {
        case 1: printf("Trufa de Nozes com Chocolate"); break;
        case 2: printf("Torta Mousse de Limão"); break;
        case 3: printf("Bolo de Brigadeiro"); break;
        case 4: printf("Bolo Cookie de Nutella"); break;
        default: printf("Doce inválido");
    }
}

int main() {
	setlocale(LC_ALL, "Portuguese");

    char nomeCliente[30];
    int tipoDoce;
    float kgDoce, valorPorKG, valorTotal;

    printf("=== SEJA BEM-VINDO(A) À SUGAR CAKE ===\n\n");

    printf("Digite seu nome: ");
    fgets(nomeCliente, sizeof(nomeCliente), stdin);
    nomeCliente[strcspn(nomeCliente, "\n")] = '\0'; // remove quebra de linha

    printf("\n--- CARDÁPIO ---\n");
    printf("[1] Trufa de Nozes com Chocolate\n");
    printf("[2] Torta Mousse de Limão\n");
    printf("[3] Bolo de Brigadeiro\n");
    printf("[4] Bolo Cookie de Nutella\n");

    printf("\nDigite o código do doce desejado: ");
    scanf("%d", &tipoDoce);

    printf("Digite a quantidade em KG: ");
    scanf("%f", &kgDoce);

    valorPorKG = obterValorPorKG(tipoDoce, kgDoce);

    if (valorPorKG < 0) {
        printf("\nDoce inválido. Encerrando o programa.\n");
        return 1;
    }

    valorTotal = kgDoce * valorPorKG;

    printf("\n================ EXTRATO ================\n");
    printf("Cliente: %s\n", nomeCliente);
    printf("Doce escolhido: ");
    mostrarNomeDoce(tipoDoce);
    printf("\nQuantidade: %.2f KG\n", kgDoce);
    printf("Valor por KG: R$ %.2f\n", valorPorKG);
    printf("Valor total da compra: R$ %.2f\n", valorTotal);
    printf("========================================\n");

    return 0;
}