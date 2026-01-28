/*
 * Programa: Média de Combustível
 * Objetivo: Verificar qual combustível compensa mais (gasolina ou álcool) e calcular a média de consumo do veículo em km por litro.
 * Estrutura utilizada: decisão (if / else)
 */

#include <stdio.h>
#include <locale.h>

#define PORCENTAGEM 0.70

int main() {
    setlocale(LC_ALL, "Portuguese");

    float precoGasolina, precoAlcool;
    float relacaoCombustivel;
    float precoLitro, litrosAbastecidos;
    float kmInicial, kmFinal, kmRodado;
    float valorPago, mediaConsumo, mediaDesejada;

    printf("=== GASOLINA OU ÁLCOOL: QUAL COMPENSA? ===\n");

    printf("\nInforme o preço da gasolina (R$): ");
    scanf("%f", &precoGasolina);

    printf("Informe o preço do álcool (R$): ");
    scanf("%f", &precoAlcool);

    relacaoCombustivel = precoAlcool / precoGasolina;

    printf("\nRelação álcool/gasolina: %.2f\n", relacaoCombustivel);

    if (relacaoCombustivel >= PORCENTAGEM) {
        printf("Compensa utilizar GASOLINA.\n");
    } else {
        printf("Compensa utilizar ÁLCOOL.\n");
    }

    printf("\n========================================\n");
    printf("=== CÁLCULO DA MÉDIA DE CONSUMO ===\n");

    printf("\nPreço do litro abastecido (R$): ");
    scanf("%f", &precoLitro);

    printf("Quantidade de litros abastecidos: ");
    scanf("%f", &litrosAbastecidos);

    valorPago = precoLitro * litrosAbastecidos;

    printf("Quilometragem antes de abastecer: ");
    scanf("%f", &kmInicial);

    printf("Quilometragem atual do veículo: ");
    scanf("%f", &kmFinal);

    kmRodado = kmFinal - kmInicial;
    mediaConsumo = kmRodado / litrosAbastecidos;

    printf("\nValor pago no abastecimento: R$ %.2f\n", valorPago);
    printf("Quilômetros rodados: %.2f km\n", kmRodado);
    printf("Média de consumo: %.2f km/l\n", mediaConsumo);

    printf("\nInforme a média desejada (km/l): ");
    scanf("%f", &mediaDesejada);

    if (mediaConsumo >= mediaDesejada) {
        printf("Consumo econômico.\n");
    } else {
        printf("A média de consumo está abaixo do esperado.\n");
    }

    printf("\n========================================\n");

    return 0;
}
