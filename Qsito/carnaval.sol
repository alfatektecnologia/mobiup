// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract CarnavalScores is ERC20 {
    struct Jurado {
        address endereco;
        string nome;
    }

    struct Escola {
        uint id;
        string nome;
    }

    struct Quesito {
        uint id;
        string nome;
    }

    struct Nota {
        uint escolaId;
        uint quesitoId;
        address juradoId;
        uint nota;       
    }

    uint8 internal constant QUANTIDADE_JURADOS = 36;
    uint8 internal constant QUANTIDADE_QUESITOS = 9;
    uint8 internal constant QUANTIDADE_ESCOLAS = 15;

    Jurado[QUANTIDADE_JURADOS] public quantidadeJurados;
    Escola[QUANTIDADE_ESCOLAS] public escolas;
    Quesito[QUANTIDADE_QUESITOS] public quesitos;
    Nota[] public notas;
    
    mapping(address => Jurado) public jurados;
    mapping(uint => mapping(uint => Nota)) public notasPorEscolaQuesito;  // Mapeamento de notas por escola e quesito

    constructor() ERC20("CarnavalScores", "CCS") {}

    
    uint8 private currentJuradoIndex = 0;
    uint8 private currentEscolaIndex = 0;
    uint8 private currentQuesitoIndex = 0;
    event JuradoAdicionado(address indexed jurado, string _nome);
    event EscolaAdicionada(uint id, string _nome);
    event QuesitoAdicionado(uint8 id,string _nome);

    // Add new judge
    function addJurado(string memory _nomeJurado) public returns (uint) {
        require(currentJuradoIndex < QUANTIDADE_JURADOS, "Quantidade maxima de jurados");
        jurados[msg.sender] = Jurado({endereco: msg.sender, nome: _nomeJurado});
        quantidadeJurados[currentJuradoIndex] = Jurado({endereco: msg.sender, nome: _nomeJurado});
        currentJuradoIndex++;
        emit JuradoAdicionado(msg.sender, _nomeJurado);
        return currentJuradoIndex - 1;
    }

    // Add new team
    function addEscola(string memory _nomeEscola) public returns (uint) {
        require(currentEscolaIndex < QUANTIDADE_ESCOLAS, "Quantidade maxima de escolas");
        escolas[currentEscolaIndex]= Escola({id: currentEscolaIndex, nome: _nomeEscola});
        emit EscolaAdicionada(currentEscolaIndex, _nomeEscola);
        currentEscolaIndex++;      
        return currentEscolaIndex - 1;
    }

    // Add new quesito
    function addQuesito(string memory _nomeQuesito) public returns (uint) {
        require(currentQuesitoIndex < QUANTIDADE_QUESITOS, "Quantidade maxima de quesitos");
        quesitos[currentQuesitoIndex] = Quesito({id: currentQuesitoIndex, nome: _nomeQuesito});
        emit QuesitoAdicionado(currentQuesitoIndex,_nomeQuesito);
        currentQuesitoIndex++;
        return currentQuesitoIndex - 1;
    }

    // Save a score
    function registrarNota(uint8 _escolaId, uint8 _quesitoId, uint16 _nota) public {
        require(jurados[msg.sender].endereco == msg.sender, "Somente jurados podem registrar");
        require(_nota >= 900 && _nota <= 1000, "Nota impossivel");
        Nota memory nota = Nota({escolaId:_escolaId,
                              quesitoId: _quesitoId,
                               juradoId :msg.sender,
                                nota    :_nota});
        notas.push(nota);
        notasPorEscolaQuesito[_escolaId][_quesitoId] = nota;
    }
    
    // Get the score for a team
    function getNota(uint _escolaId, uint _quesitoId) public view returns (uint) {
        Nota storage nota = notasPorEscolaQuesito[_escolaId][_quesitoId];
        return nota.nota;
    }

    // Clear all stored data
    function limparDados() public {
        delete quantidadeJurados;
        delete escolas;
        delete quesitos;
        delete notas;

        // Reinitializing mappings
        for (uint i = 0; i < QUANTIDADE_ESCOLAS; i++) {
            for (uint j = 0; j < QUANTIDADE_QUESITOS; j++) {
                delete notasPorEscolaQuesito[i][j];
            }
        }
    }
}
