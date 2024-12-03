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
    uint internal constant QUANTIDADE_QUESITOS = 9;
    uint internal constant QUANTIDADE_ESCOLAS = 12;

    Jurado[] private  quantidadeJurados;
    Escola[] private _escolas;
    Quesito[] private _quesitos;
    Nota[] private notas;
    
    mapping(address => Jurado) private jurados;
    mapping(uint => mapping(uint => Nota)) public notasPorEscolaQuesito;  // Mapeamento de notas por escola e quesito

    address public owner;
    string[] private nomeEscolas = ["Unidos de Padre Miguel","Imperatriz Leopoldinense","Unidos do Viradouro","Estacoes Primeira de Mangueira",
    "Unidos da Tijuca","Beija-Flor de Nilopolis","Academicos do Salgueiro","Unidos de Vila Isabel","Mocidade Independente de Padre Miguel",
    "Paraiso do Tuiuti","Academicos do Grande Rio","Portela"];

    string[] private qsitos = ["Samba-enredo","Bateria","Harmonia","Evolucao","Comissao de frente","Alegorias","Fantasia","Mestre-sala","Enredo"];
    
    constructor() ERC20("CarnavalScores", "CCS") {
        owner = msg.sender;
        addEscolas(nomeEscolas);
        addQuesitos(qsitos);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Acesso restrito ao proprietario");
        _;
    }
    
    uint private _currentJuradoIndex = 0;
    uint private _currentEscolaIndex = 0;
    uint private _currentQuesitoIndex = 0;
    event JuradoAdicionado(address indexed jurado, string _nomeJurado);
    event EscolasAdicionadas(string[] _nomeEscola);
    event QuesitoAdicionados(string[] _nomeQuesito);

    // Add new judge
    function addJurado(string memory _nomeJurado, uint _quesitoId) public onlyOwner returns (uint) {
        require(quantidadeJurados.length < QUANTIDADE_JURADOS, "Quantidade maxima de jurados");
        jurados[msg.sender] = Jurado({endereco: msg.sender, nome: _nomeJurado, quesitoId: _quesitoId});
        quantidadeJurados.push(Jurado({endereco: msg.sender, nome: _nomeJurado, quesitoId: _quesitoId}));
        
        emit JuradoAdicionado(msg.sender, _nomeJurado);
        return quantidadeJurados.length - 1;
    }

    

    // Add new teams
    function addEscolas(string[] memory _nomeEscolas) private onlyOwner {
        require(_escolas.length < QUANTIDADE_ESCOLAS,"Quantidade maxima de escolas atingida");
        for (uint i = 0; i < _nomeEscolas.length; i++) {
            require(_currentEscolaIndex < QUANTIDADE_ESCOLAS, "Quantidade maxima de escolas atingida");
            _escolas.push(Escola({id: _currentEscolaIndex, nome: _nomeEscolas[i]}));
            _currentEscolaIndex++;
        }
        emit EscolasAdicionadas(_nomeEscolas);
    }

    // Add new quesitos
    function addQuesitos(string[] memory _nomeQuesitos) private onlyOwner {
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
    function getQuesitos() public view returns  (string[] memory){
        require(_quesitos.length > 0, "No quesitos found");
    
        return qsitos;
    }
    // Get all escolas
    function getEscolas() public view returns  (string[] memory){
        require(_escolas.length > 0, "No escola found");
    
        return nomeEscolas;
    }

    // Get all judges
    function getJurados() public view returns  (Jurado[] memory){
        require(quantidadeJurados.length > 0, "No judge found");
    
        return quantidadeJurados;
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

