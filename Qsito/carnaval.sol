// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract CarnavalScores is ERC20 {
    struct Jurado {
        address endereco;
        string nome;
        uint quesitoId;
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

    uint internal constant QUANTIDADE_JURADOS = 36;
    uint internal constant QUANTIDADE_QUESITOS = 8;
    uint internal constant QUANTIDADE_ESCOLAS = 12;

    Jurado[QUANTIDADE_JURADOS] public quantidadeJurados;
    Escola[] private _escolas;
    Quesito[] private _quesitos;
    Nota[] public notas;
    
    mapping(address => Jurado) public jurados;
    mapping(uint => mapping(uint => Nota)) public notasPorEscolaQuesito;  // Mapeamento de notas por escola e quesito

    address public owner;
    
    constructor() ERC20("CarnavalScores", "CCS") {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Acesso restrito ao proprietario");
        _;
    }
    
    uint private _currentJuradoIndex = 0;
    uint private _currentEscolaIndex = 0;
    uint private _currentQuesitoIndex = 0;
    event JuradoAdicionado(address indexed jurado, string _nome);
    event EscolasAdicionadas(string[] _nome);
    event QuesitoAdicionados(string[] _nome);

    // Add new judge
    function addJurado(string memory _nomeJurado, uint _quesitoId) public onlyOwner returns (uint) {
        require(_currentJuradoIndex < QUANTIDADE_JURADOS, "Quantidade maxima de jurados");
        jurados[msg.sender] = Jurado({endereco: msg.sender, nome: _nomeJurado, quesitoId: _quesitoId});
        quantidadeJurados[_currentJuradoIndex] = Jurado({endereco: msg.sender, nome: _nomeJurado, quesitoId: _quesitoId});
        _currentJuradoIndex++;
        emit JuradoAdicionado(msg.sender, _nomeJurado);
        return _currentJuradoIndex - 1;
    }

    // Add new teams
    function addEscolas(string[] memory _nomeEscolas) public onlyOwner {
        require(_escolas.length < QUANTIDADE_ESCOLAS,"Quantidade maxima de escolas atingida");
        for (uint i = 0; i < _nomeEscolas.length; i++) {
            require(_currentEscolaIndex < QUANTIDADE_ESCOLAS, "Quantidade maxima de escolas atingida");
            _escolas.push(Escola({id: _currentEscolaIndex, nome: _nomeEscolas[i]}));
            _currentEscolaIndex++;
        }
        emit EscolasAdicionadas(_nomeEscolas);
    }

    // Add new quesitos
    function addQuesitos(string[] memory _nomeQuesitos) public onlyOwner {
        require(_quesitos.length < QUANTIDADE_QUESITOS, "Quantidade maxima de quesitos atingida");
        for (uint i = 0; i < _nomeQuesitos.length; i++) {
            require(_currentQuesitoIndex < QUANTIDADE_QUESITOS, "Quantidade maxima de quesitos atingida");
            _quesitos.push(Quesito({id: _currentQuesitoIndex, nome: _nomeQuesitos[i]}));
            _currentQuesitoIndex++;
        }
        emit QuesitoAdicionados(_nomeQuesitos);
    }

    // Save a score
    function registrarNota(uint _escolaId, uint _quesitoId, uint _nota) public {
        require(jurados[msg.sender].endereco == msg.sender, "Somente jurados podem registrar");
        require(_nota >= 900 && _nota <= 1000, "Nota impossivel");
        Nota memory nota = Nota({
            escolaId: _escolaId,
            quesitoId: _quesitoId,
            juradoId: msg.sender,
            nota: _nota
        });
        notas.push(nota);
        notasPorEscolaQuesito[_escolaId][_quesitoId] = nota;
    }
  
    // Get a score by escolaId and quesitoId
    function getNota(uint _escolaId, uint _quesitoId) public view returns (uint256) {
        require(notasPorEscolaQuesito[_escolaId][_quesitoId].nota > 0, "Nota nao encontrada");
        return notasPorEscolaQuesito[_escolaId][_quesitoId].nota;
    }

    // Get all quesitos
    function getAllQuesitos() public view returns  (Quesito[] memory){
        require(_quesitos.length > 0, "No quesitos found");
    
        return _quesitos;
    }
    // Get all escolas
    function getAllEscolas() public view returns  (Escola[] memory){
        require(_escolas.length > 0, "No escola found");
    
        return _escolas;
    }

    // Clear all stored data
    function limparDados() public onlyOwner {
        delete quantidadeJurados;
        delete _escolas;
        delete _quesitos;
        delete notas;

        // Reinitializing mappings
        for (uint i = 0; i < QUANTIDADE_ESCOLAS; i++) {
            for (uint j = 0; j < QUANTIDADE_QUESITOS; j++) {
                delete notasPorEscolaQuesito[i][j];
            }
        }
    }
}

