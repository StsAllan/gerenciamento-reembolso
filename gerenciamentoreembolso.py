# Função para exibir o menu
def exibir_menu():
    print("===== MENU =====")
    print("1. Adicionar pedido de reembolso")
    print("2. Processar pedido de reembolso")
    print("3. Checar status dos reembolsos processados")
    print("4. Sair")
    return input("Escolha uma opção: ")

# Função para adicionar um pedido à fila
def adicionar_pedido(fila):
    if len(fila) < 100:  # Verifica se a fila não está cheia
        pedido = {}
        pedido["numero_pedido"] = input("Número do pedido: ")
        pedido["numero_compra"] = input("Número da compra: ")
        pedido["descricao"] = input("Descrição da solicitação: ")
        fila.append(pedido)
        print("Pedido adicionado à fila com sucesso!")
    else:
        print("Fila cheia! Não é possível adicionar mais pedidos.")

# Função para processar um pedido
def processar_pedido(fila, processados):
    if fila:  # Verifica se a fila não está vazia
        pedido = fila.pop(0)  # Remove o primeiro pedido da fila
        print("\n===== DETALHES DO PEDIDO =====")
        print(f"Número do pedido: {pedido['numero_pedido']}")
        print(f"Número da compra: {pedido['numero_compra']}")
        print(f"Descrição: {pedido['descricao']}")
        print("=============================")

        decisao = input("Decisão (aprovado/reprovado): ").strip().lower()
        pedido["decisao"] = decisao

        if decisao == "reprovado":
            pedido["justificativa"] = input("Justificativa: ")
        else:
            pedido["justificativa"] = None

        processados.append(pedido)  # Adiciona o pedido à lista de processados
        print("\n===== RESULTADO DA ANÁLISE =====")
        print(f"Número do pedido: {pedido['numero_pedido']}")
        print(f"Número da compra: {pedido['numero_compra']}")
        print(f"Descrição: {pedido['descricao']}")
        print(f"Decisão: {decisao}")
        if decisao == "reprovado":
            print(f"Justificativa: {pedido['justificativa']}")
    else:
        print("Fila vazia! Nenhum pedido para processar.")

# Função para checar os status dos reembolsos processados
def checar_status(processados):
    if processados:  # Verifica se há pedidos processados
        print("\n===== REEMBOLSOS PROCESSADOS =====")
        for i, pedido in enumerate(processados, start=1):
            print(f"Pedido {i}:")
            print(f"  Número do pedido: {pedido['numero_pedido']}")
            print(f"  Número da compra: {pedido['numero_compra']}")
            print(f"  Descrição: {pedido['descricao']}")
            print(f"  Decisão: {pedido['decisao']}")
            if pedido["decisao"] == "reprovado":
                print(f"  Justificativa: {pedido['justificativa']}")
            print("-----------------------------")
    else:
        print("Nenhum reembolso processado ainda.")

# Função principal
def main():
    fila = []  # Fila de pedidos pendentes
    processados = []  # Lista de pedidos processados

    while True:
        opcao = exibir_menu()

        if opcao == "1":
            adicionar_pedido(fila)
        elif opcao == "2":
            processar_pedido(fila, processados)
        elif opcao == "3":
            checar_status(processados)
        elif opcao == "4":
            print("Saindo do sistema...")
            break
        else:
            print("Opção inválida! Tente novamente.")

# Executa o programa
if __name__ == "__main__":
    main()