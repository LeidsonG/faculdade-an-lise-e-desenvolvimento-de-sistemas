/*
 * Programa: Cálculo de IMC (Índice de Massa Corporal)
 * Objetivo: Calcular o IMC do usuário e informar sua classificação de acordo com os padrões da Organização Mundial da Saúde (OMS).
 * Estrutura utilizada: decisão (if / else if / else)
 */

#include <stdio.h>
#include <locale.h>
#include <string.h>

int main() {
    setlocale(LC_ALL, "Portuguese");

    char nome[50];
    float peso, altura, imc;

    printf("=== CÁLCULO DO IMC ===\n\n");

    printf("Digite seu nome: ");
    fgets(nome, sizeof(nome), stdin);
    nome[strcspn(nome, "\n")] = '\0';

    printf("Digite seu peso (kg): ");
    scanf("%f", &peso);

    printf("Digite sua altura (m): ");
    scanf("%f", &altura);

    imc = peso / (altura * altura);

    printf("\n----------------------------------------\n");
    printf("Nome: %s\n", nome);
    printf("Peso: %.2f kg\n", peso);
    printf("Altura: %.2f m\n", altura);
    printf("IMC: %.2f\n", imc);

    if (imc < 18.5) {
        printf("Classificação: Abaixo do peso\n");
    }
    else if (imc < 25.0) {
        printf("Classificação: Peso normal\n");
    }
    else if (imc < 30.0) {
        printf("Classificação: Sobrepeso\n");
    }
    else if (imc < 35.0) {
        printf("Classificação: Obesidade Grau I\n");
    }
    else if (imc < 40.0) {
        printf("Classificação: Obesidade Grau II\n");
    }
    else {
        printf("Classificação: Obesidade Grau III (mórbida)\n");
    }

    printf("----------------------------------------\n");

    return 0;
}