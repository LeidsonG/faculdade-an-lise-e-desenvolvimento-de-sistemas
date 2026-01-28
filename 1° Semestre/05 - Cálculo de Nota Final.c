/*
 * Programa: Cálculo de Nota Final
 * Objetivo: Calcular a média final do aluno e verificar se está aprovado.
 * Estrutura utilizada: decisão simples (if / else)
 */

#include <stdio.h>
#include <locale.h>
#include <string.h>

int main() {
    setlocale(LC_ALL, "Portuguese");

    float notaProva1, notaProva2;
    float mediaProva, mediaTrabalho, mediaFinal;
    char nomeAluno[50];

    printf("*** CÁLCULO DE NOTA FINAL ***\n\n");

    printf("Digite o nome do aluno: ");
    fgets(nomeAluno, sizeof(nomeAluno), stdin);
    nomeAluno[strcspn(nomeAluno, "\n")] = '\0'; // remove quebra de linha

    printf("Digite a nota da Prova 1: ");
    scanf("%f", &notaProva1);

    printf("Digite a nota da Prova 2: ");
    scanf("%f", &notaProva2);

    printf("Digite a média do trabalho: ");
    scanf("%f", &mediaTrabalho);

    mediaProva = (notaProva1 + notaProva2) / 2.0;
    mediaFinal = (mediaProva * 0.7) + (mediaTrabalho * 0.3);

    printf("\n----------------------------------------\n");

    if (mediaFinal >= 7.0) {
        printf("Situação: APROVADO\n");
    } else {
        printf("Situação: REPROVADO\n");
    }

    printf("\nNome do aluno: %s", nomeAluno);
    printf("\nNota Prova 1: %.2f", notaProva1);
    printf("\nNota Prova 2: %.2f", notaProva2);
    printf("\nMédia do Trabalho: %.2f", mediaTrabalho);
    printf("\nMédia Final: %.2f", mediaFinal);

    printf("\n----------------------------------------\n");

    return 0;
}