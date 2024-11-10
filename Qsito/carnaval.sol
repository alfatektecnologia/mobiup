// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

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
        uint juradoId;
        uint nota;
    }

    Jurado[] public jurados;
    Escola[] public escolas;
    Quesito[] public quesitos;
    Nota[] public notas;

    //constructor must do...

    constructor() ERC20("CarnavalScores", "CCS") {}

    // Add new judge
    function addJurado(string memory _nome) public returns (uint) {
        jurados.push(Jurado({endereco: msg.sender, nome: _nome}));
        return jurados.length - 1;
    }

    // Add new team
    function addEscola(string memory _nome) public returns (uint) {
        escolas.push(Escola({id: escolas.length, nome: _nome}));
        return escolas.length - 1;
    }

    // Add new quesito
    function addQuesito(string memory _nome) public returns (uint) {
        quesitos.push(Quesito({id: quesitos.length, nome: _nome}));
        return quesitos.length - 1;
    }

    // Save a score
    function registrarNota(uint _escolaId, uint _quesitoId, uint _nota) public {
        require(jurados[msg.sender].endereco == msg.sender, "Somente jurados podem registrar notas");
        require(_nota >= 9 && _nota <= 10, "Nota impossivel");
        notas.push(Nota({escolaId: _escolaId, quesitoId: _quesitoId, juradoId: msg.sender, nota: _nota}));
    }

    // Get the sore for a team
    function getNota(uint _escolaId, uint _quesitoId) public view returns (uint) {
        for (uint i = 0; i < notas.length; i++) {
            if (notas[i].escolaId == _escolaId && notas[i].quesitoId == _quesitoId) {
                return notas[i].nota;
            }
        }
        return 0; // Score not found
    }
}
