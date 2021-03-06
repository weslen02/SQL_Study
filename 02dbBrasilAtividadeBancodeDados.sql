---dbBrasil Curto na atividade banco de dados
USE atividadeBancodeDados

CREATE TABLE pais(
	idPais		INT IDENTITY(1,1) NOT NULL,
	nome		VARCHAR(60),
	sigla		VARCHAR(10),

	CONSTRAINT	pk_pais PRIMARY KEY (idPais) --sem constraint gera um nome e key extenso
)

INSERT INTO pais(nome, sigla) VALUES('Brasil', 'BR')

SELECT *FROM pais

CREATE TABLE estados(
	idEstado	INT NOT NULL,
	nome		VARCHAR(75),
	uf			VARCHAR(5),
	
	idPais		INT, --para relacionar com fk desta tabela com a tabela pais
	
	CONSTRAINT	pk_estado PRIMARY KEY (idEstado),--define a chave primaria, e com constraint setamos um apelido
	CONSTRAINT	fk_idPais FOREIGN KEY (idPais)
					REFERENCES pais	  (idPais)
)

INSERT INTO estados (idEstado, nome, uf, idPais) VALUES
(1, 'Acre', 'AC', 1),
(2, 'Alagoas', 'AL', 1),
(3, 'Amazonas', 'AM', 1),
(4, 'Amap�', 'AP', 1),
(5, 'Bahia', 'BA', 1),
(6, 'Cear�', 'CE', 1),
(7, 'Distrito Federal', 'DF', 1),
(8, 'Esp�rito Santo', 'ES', 1),
(9, 'Goi�s', 'GO', 1),
(10, 'Maranh�o', 'MA', 1),
(11, 'Minas Gerais', 'MG', 1),
(12, 'Mato Grosso do Sul', 'MS', 1),
(13, 'Mato Grosso', 'MT', 1),
(14, 'Par�', 'PA', 1),
(15, 'Para�ba', 'PB', 1),
(16, 'Pernambuco', 'PE', 1),
(17, 'Piau�', 'PI', 1),
(18, 'Paran�', 'PR', 1),
(19, 'Rio de Janeiro', 'RJ', 1),
(20, 'Rio Grande do Norte', 'RN', 1),
(21, 'Rond�nia', 'RO', 1),
(22, 'Roraima', 'RR', 1),
(23, 'Rio Grande do Sul', 'RS', 1),
(24, 'Santa Catarina', 'SC', 1),
(25, 'Sergipe', 'SE', 1),
(26, 'S�o Paulo', 'SP', 1),
(27, 'Tocantins', 'TO', 1);

SELECT *FROM estados

CREATE TABLE cidades(
	idCidade	INT NOT NULL,
	nome		CHAR(75),
	
	idEstado	INT, --para relacionar com fk desta tabela com tabela estado
	CONSTRAINT	pk_cidade PRIMARY KEY(idCidade),
	CONSTRAINT	fk_idEstado FOREIGN KEY(idEstado)
				REFERENCES estados	  (idEstado)
)

INSERT INTO cidades (idCidade, nome, idEstado) VALUES
(1, 'Afonso Cl�udio', 8),
(2, '�gua Doce do Norte', 8),
(3, '�guia Branca', 8),
(4, 'Alegre', 8),
(5, 'Alfredo Chaves', 8),
(6, 'Alto Rio Novo', 8),
(7, 'Anchieta', 8),
(8, 'Apiac�', 8),
(9, 'Aracruz', 8),
(10, 'Atilio Vivacqua', 8),
(11, 'Baixo Guandu', 8),
(12, 'Barra de S�o Francisco', 8),
(13, 'Boa Esperan�a', 8),
(14, 'Bom Jesus do Norte', 8),
(15, 'Brejetuba', 8),
(16, 'Cachoeiro de Itapemirim', 8),
(17, 'Cariacica', 8),
(18, 'Castelo', 8),
(19, 'Colatina', 8),
(20, 'Concei��o da Barra', 8),
(21, 'Concei��o do Castelo', 8),
(22, 'Divino de S�o Louren�o', 8),
(23, 'Domingos Martins', 8),
(24, 'Dores do Rio Preto', 8),
(25, 'Ecoporanga', 8),
(26, 'Fund�o', 8),
(27, 'Governador Lindenberg', 8),
(28, 'Gua�u�', 8),
(29, 'Guarapari', 8),
(30, 'Ibatiba', 8),
(31, 'Ibira�u', 8),
(32, 'Ibitirama', 8),
(33, 'Iconha', 8),
(34, 'Irupi', 8),
(35, 'Itagua�u', 8),
(36, 'Itapemirim', 8),
(37, 'Itarana', 8),
(38, 'I�na', 8),
(39, 'Jaguar�', 8),
(40, 'Jer�nimo Monteiro', 8),
(41, 'Jo�o Neiva', 8),
(42, 'Laranja da Terra', 8),
(43, 'Linhares', 8),
(44, 'Manten�polis', 8),
(45, 'Marata�zes', 8),
(46, 'Marechal Floriano', 8),
(47, 'Maril�ndia', 8),
(48, 'Mimoso do Sul', 8),
(49, 'Montanha', 8),
(50, 'Mucurici', 8),
(51, 'Muniz Freire', 8),
(52, 'Muqui', 8),
(53, 'Nova Ven�cia', 8),
(54, 'Pancas', 8),
(55, 'Pedro Can�rio', 8),
(56, 'Pinheiros', 8),
(57, 'Pi�ma', 8),
(58, 'Ponto Belo', 8),
(59, 'Presidente Kennedy', 8),
(60, 'Rio Bananal', 8),
(61, 'Rio Novo do Sul', 8),
(62, 'Santa Leopoldina', 8),
(63, 'Santa Maria de Jetib�', 8),
(64, 'Santa Teresa', 8),
(65, 'S�o Domingos do Norte', 8),
(66, 'S�o Gabriel da Palha', 8),
(67, 'S�o Jos� do Cal�ado', 8),
(68, 'S�o Mateus', 8),
(69, 'S�o Roque do Cana�', 8),
(70, 'Serra', 8),
(71, 'Sooretama', 8),
(72, 'Vargem Alta', 8),
(73, 'Venda Nova do Imigrante', 8),
(74, 'Viana', 8),
(75, 'Vila Pav�o', 8),
(76, 'Vila Val�rio', 8),
(77, 'Vila Velha', 8),
(78, 'Vit�ria', 8),
(79, 'Acrel�ndia', 1),
(80, 'Assis Brasil', 1),
(81, 'Brasil�ia', 1),
(82, 'Bujari', 1),
(83, 'Capixaba', 1),
(84, 'Cruzeiro do Sul', 1),
(85, 'Epitaciol�ndia', 1),
(86, 'Feij�', 1),
(87, 'Jord�o', 1),
(88, 'M�ncio Lima', 1),
(89, 'Manoel Urbano', 1),
(90, 'Marechal Thaumaturgo', 1),
(91, 'Pl�cido de Castro', 1),
(92, 'Porto Acre', 1),
(93, 'Porto Walter', 1),
(94, 'Rio Branco', 1),
(95, 'Rodrigues Alves', 1),
(96, 'Santa Rosa do Purus', 1),
(97, 'Sena Madureira', 1),
(98, 'Senador Guiomard', 1),
(99, 'Tarauac�', 1),
(100, 'Xapuri', 1),
(101, '�gua Branca', 2),
(102, 'Anadia', 2),
(103, 'Arapiraca', 2),
(104, 'Atalaia', 2),
(105, 'Barra de Santo Ant�nio', 2),
(106, 'Barra de S�o Miguel', 2),
(107, 'Batalha', 2),
(108, 'Bel�m', 2),
(109, 'Belo Monte', 2),
(110, 'Boca da Mata', 2),
(111, 'Branquinha', 2),
(112, 'Cacimbinhas', 2),
(113, 'Cajueiro', 2),
(114, 'Campestre', 2),
(115, 'Campo Alegre', 2),
(116, 'Campo Grande', 2),
(117, 'Canapi', 2),
(118, 'Capela', 2),
(119, 'Carneiros', 2),
(120, 'Ch� Preta', 2),
(121, 'Coit� do N�ia', 2),
(122, 'Col�nia Leopoldina', 2),
(123, 'Coqueiro Seco', 2),
(124, 'Coruripe', 2),
(125, 'Cra�bas', 2),
(126, 'Delmiro Gouveia', 2),
(127, 'Dois Riachos', 2),
(128, 'Estrela de Alagoas', 2),
(129, 'Feira Grande', 2),
(130, 'Feliz Deserto', 2),
(131, 'Flexeiras', 2),
(132, 'Girau do Ponciano', 2),
(133, 'Ibateguara', 2),
(134, 'Igaci', 2),
(135, 'Igreja Nova', 2),
(136, 'Inhapi', 2),
(137, 'Jacar� dos Homens', 2),
(138, 'Jacu�pe', 2),
(139, 'Japaratinga', 2),
(140, 'Jaramataia', 2),
(141, 'Jequi� da Praia', 2),
(142, 'Joaquim Gomes', 2),
(143, 'Jundi�', 2),
(144, 'Junqueiro', 2),
(145, 'Lagoa da Canoa', 2),
(146, 'Limoeiro de Anadia', 2),
(147, 'Macei�', 2),
(148, 'Major Isidoro', 2),
(149, 'Mar Vermelho', 2),
(150, 'Maragogi', 2),
(151, 'Maravilha', 2),
(152, 'Marechal Deodoro', 2),
(153, 'Maribondo', 2),
(154, 'Mata Grande', 2),
(155, 'Matriz de Camaragibe', 2),
(156, 'Messias', 2),
(157, 'Minador do Negr�o', 2),
(158, 'Monteir�polis', 2),
(159, 'Murici', 2),
(160, 'Novo Lino', 2),
(161, 'Olho d`�gua das Flores', 2),
(162, 'Olho d`�gua do Casado', 2),
(163, 'Olho d`�gua Grande', 2),
(164, 'Oliven�a', 2),
(165, 'Ouro Branco', 2),
(166, 'Palestina', 2),
(167, 'Palmeira dos �ndios', 2),
(168, 'P�o de A��car', 2),
(169, 'Pariconha', 2),
(170, 'Paripueira', 2),
(171, 'Passo de Camaragibe', 2),
(172, 'Paulo Jacinto', 2),
(173, 'Penedo', 2),
(174, 'Pia�abu�u', 2),
(175, 'Pilar', 2),
(176, 'Pindoba', 2),
(177, 'Piranhas', 2),
(178, 'Po�o das Trincheiras', 2),
(179, 'Porto Calvo', 2),
(180, 'Porto de Pedras', 2),
(181, 'Porto Real do Col�gio', 2),
(182, 'Quebrangulo', 2),
(183, 'Rio Largo', 2),
(184, 'Roteiro', 2),
(185, 'Santa Luzia do Norte', 2),
(186, 'Santana do Ipanema', 2),
(187, 'Santana do Munda�', 2),
(188, 'S�o Br�s', 2),
(189, 'S�o Jos� da Laje', 2),
(190, 'S�o Jos� da Tapera', 2),
(191, 'S�o Lu�s do Quitunde', 2),
(192, 'S�o Miguel dos Campos', 2),
(193, 'S�o Miguel dos Milagres', 2),
(194, 'S�o Sebasti�o', 2),
(195, 'Satuba', 2),
(196, 'Senador Rui Palmeira', 2),
(197, 'Tanque d`Arca', 2),
(198, 'Taquarana', 2),
(199, 'Teot�nio Vilela', 2),
(200, 'Traipu', 2),
(201, 'Uni�o dos Palmares', 2),
(202, 'Vi�osa', 2),
(203, 'Amap�', 4),
(204, 'Cal�oene', 4),
(205, 'Cutias', 4),
(206, 'Ferreira Gomes', 4),
(207, 'Itaubal', 4),
(208, 'Laranjal do Jari', 4),
(209, 'Macap�', 4),
(210, 'Mazag�o', 4),
(211, 'Oiapoque', 4),
(212, 'Pedra Branca do Amapar�', 4),
(213, 'Porto Grande', 4),
(214, 'Pracu�ba', 4),
(215, 'Santana', 4),
(216, 'Serra do Navio', 4),
(217, 'Tartarugalzinho', 4),
(218, 'Vit�ria do Jari', 4),
(219, 'Alvar�es', 3),
(220, 'Amatur�', 3),
(221, 'Anam�', 3),
(222, 'Anori', 3),
(223, 'Apu�', 3),
(224, 'Atalaia do Norte', 3),
(225, 'Autazes', 3),
(226, 'Barcelos', 3),
(227, 'Barreirinha', 3),
(228, 'Benjamin Constant', 3),
(229, 'Beruri', 3),
(230, 'Boa Vista do Ramos', 3),
(231, 'Boca do Acre', 3),
(232, 'Borba', 3),
(233, 'Caapiranga', 3),
(234, 'Canutama', 3),
(235, 'Carauari', 3),
(236, 'Careiro', 3),
(237, 'Careiro da V�rzea', 3),
(238, 'Coari', 3),
(239, 'Codaj�s', 3),
(240, 'Eirunep�', 3),
(241, 'Envira', 3),
(242, 'Fonte Boa', 3),
(243, 'Guajar�', 3),
(244, 'Humait�', 3),
(245, 'Ipixuna', 3),
(246, 'Iranduba', 3),
(247, 'Itacoatiara', 3),
(248, 'Itamarati', 3),
(249, 'Itapiranga', 3),
(250, 'Japur�', 3),
(251, 'Juru�', 3),
(252, 'Juta�', 3),
(253, 'L�brea', 3),
(254, 'Manacapuru', 3),
(255, 'Manaquiri', 3),
(256, 'Manaus', 3),
(257, 'Manicor�', 3),
(258, 'Mara�', 3),
(259, 'Mau�s', 3),
(260, 'Nhamund�', 3),
(261, 'Nova Olinda do Norte', 3),
(262, 'Novo Air�o', 3),
(263, 'Novo Aripuan�', 3),
(264, 'Parintins', 3),
(265, 'Pauini', 3),
(266, 'Presidente Figueiredo', 3),
(267, 'Rio Preto da Eva', 3),
(268, 'Santa Isabel do Rio Negro', 3),
(269, 'Santo Ant�nio do I��', 3),
(270, 'S�o Gabriel da Cachoeira', 3),
(271, 'S�o Paulo de Oliven�a', 3),
(272, 'S�o Sebasti�o do Uatum�', 3),
(273, 'Silves', 3),
(274, 'Tabatinga', 3),
(275, 'Tapau�', 3),
(276, 'Tef�', 3),
(277, 'Tonantins', 3),
(278, 'Uarini', 3),
(279, 'Urucar�', 3),
(280, 'Urucurituba', 3),
(281, 'Aba�ra', 5),
(282, 'Abar�', 5),
(283, 'Acajutiba', 5),
(284, 'Adustina', 5),
(285, '�gua Fria', 5),
(286, 'Aiquara', 5),
(287, 'Alagoinhas', 5),
(288, 'Alcoba�a', 5),
(289, 'Almadina', 5),
(290, 'Amargosa', 5),
(291, 'Am�lia Rodrigues', 5),
(292, 'Am�rica Dourada', 5),
(293, 'Anag�', 5),
(294, 'Andara�', 5),
(295, 'Andorinha', 5),
(296, 'Angical', 5),
(297, 'Anguera', 5),
(298, 'Antas', 5),
(299, 'Ant�nio Cardoso', 5),
(300, 'Ant�nio Gon�alves', 5),
(301, 'Apor�', 5),
(302, 'Apuarema', 5),
(303, 'Ara�as', 5),
(304, 'Aracatu', 5),
(305, 'Araci', 5),
(306, 'Aramari', 5),
(307, 'Arataca', 5),
(308, 'Aratu�pe', 5),
(309, 'Aurelino Leal', 5),
(310, 'Baian�polis', 5),
(311, 'Baixa Grande', 5),
(312, 'Banza�', 5),
(313, 'Barra', 5),
(314, 'Barra da Estiva', 5),
(315, 'Barra do Cho�a', 5),
(316, 'Barra do Mendes', 5),
(317, 'Barra do Rocha', 5),
(318, 'Barreiras', 5),
(319, 'Barro Alto', 5),
(320, 'Barro Preto (antigo Gov. Lomanto Jr.)', 5),
(321, 'Barrocas', 5),
(322, 'Belmonte', 5),
(323, 'Belo Campo', 5),
(324, 'Biritinga', 5),
(325, 'Boa Nova', 5),
(326, 'Boa Vista do Tupim', 5),
(327, 'Bom Jesus da Lapa', 5),
(328, 'Bom Jesus da Serra', 5),
(329, 'Boninal', 5),
(330, 'Bonito', 5),
(331, 'Boquira', 5),
(332, 'Botupor�', 5),
(333, 'Brej�es', 5),
(334, 'Brejol�ndia', 5),
(335, 'Brotas de Maca�bas', 5),
(336, 'Brumado', 5),
(337, 'Buerarema', 5),
(338, 'Buritirama', 5),
(339, 'Caatiba', 5),
(340, 'Cabaceiras do Paragua�u', 5),
(341, 'Cachoeira', 5),
(342, 'Cacul�', 5),
(343, 'Ca�m', 5),
(344, 'Caetanos', 5),
(345, 'Caetit�', 5),
(346, 'Cafarnaum', 5),
(347, 'Cairu', 5),
(348, 'Caldeir�o Grande', 5),
(349, 'Camacan', 5),
(350, 'Cama�ari', 5),
(351, 'Camamu', 5),
(352, 'Campo Alegre de Lourdes', 5),
(353, 'Campo Formoso', 5),
(354, 'Can�polis', 5),
(355, 'Canarana', 5),
(356, 'Canavieiras', 5),
(357, 'Candeal', 5),
(358, 'Candeias', 5),
(359, 'Candiba', 5),
(360, 'C�ndido Sales', 5),
(361, 'Cansan��o', 5),
(362, 'Canudos', 5),
(363, 'Capela do Alto Alegre', 5),
(364, 'Capim Grosso', 5),
(365, 'Cara�bas', 5),
(366, 'Caravelas', 5),
(367, 'Cardeal da Silva', 5),
(368, 'Carinhanha', 5),
(369, 'Casa Nova', 5),
(370, 'Castro Alves', 5),
(371, 'Catol�ndia', 5),
(372, 'Catu', 5),
(373, 'Caturama', 5),
(374, 'Central', 5),
(375, 'Chorroch�', 5),
(376, 'C�cero Dantas', 5),
(377, 'Cip�', 5),
(378, 'Coaraci', 5),
(379, 'Cocos', 5),
(380, 'Concei��o da Feira', 5),
(381, 'Concei��o do Almeida', 5),
(382, 'Concei��o do Coit�', 5),
(383, 'Concei��o do Jacu�pe', 5),
(384, 'Conde', 5),
(385, 'Conde�ba', 5),
(386, 'Contendas do Sincor�', 5),
(387, 'Cora��o de Maria', 5),
(388, 'Cordeiros', 5),
(389, 'Coribe', 5),
(390, 'Coronel Jo�o S�', 5),
(391, 'Correntina', 5),
(392, 'Cotegipe', 5),
(393, 'Cravol�ndia', 5),
(394, 'Cris�polis', 5),
(395, 'Crist�polis', 5),
(396, 'Cruz das Almas', 5),
(397, 'Cura��', 5),
(398, 'D�rio Meira', 5),
(399, 'Dias d`�vila', 5),
(400, 'Dom Bas�lio', 5),
(401, 'Dom Macedo Costa', 5),
(402, 'El�sio Medrado', 5),
(403, 'Encruzilhada', 5),
(404, 'Entre Rios', 5),
(405, '�rico Cardoso', 5),
(406, 'Esplanada', 5),
(407, 'Euclides da Cunha', 5),
(408, 'Eun�polis', 5),
(409, 'F�tima', 5),
(410, 'Feira da Mata', 5),
(411, 'Feira de Santana', 5),
(412, 'Filad�lfia', 5),
(413, 'Firmino Alves', 5),
(414, 'Floresta Azul', 5),
(415, 'Formosa do Rio Preto', 5),
(416, 'Gandu', 5),
(417, 'Gavi�o', 5),
(418, 'Gentio do Ouro', 5),
(419, 'Gl�ria', 5),
(420, 'Gongogi', 5),
(421, 'Governador Mangabeira', 5),
(422, 'Guajeru', 5),
(423, 'Guanambi', 5),
(424, 'Guaratinga', 5),
(425, 'Heli�polis', 5),
(426, 'Ia�u', 5),
(427, 'Ibiassuc�', 5),
(428, 'Ibicara�', 5),
(429, 'Ibicoara', 5),
(430, 'Ibicu�', 5),
(431, 'Ibipeba', 5),
(432, 'Ibipitanga', 5),
(433, 'Ibiquera', 5),
(434, 'Ibirapitanga', 5),
(435, 'Ibirapu�', 5),
(436, 'Ibirataia', 5),
(437, 'Ibitiara', 5),
(438, 'Ibitit�', 5),
(439, 'Ibotirama', 5),
(440, 'Ichu', 5),
(441, 'Igapor�', 5),
(442, 'Igrapi�na', 5),
(443, 'Igua�', 5),
(444, 'Ilh�us', 5),
(445, 'Inhambupe', 5),
(446, 'Ipecaet�', 5),
(447, 'Ipia�', 5),
(448, 'Ipir�', 5),
(449, 'Ipupiara', 5),
(450, 'Irajuba', 5),
(451, 'Iramaia', 5),
(452, 'Iraquara', 5),
(453, 'Irar�', 5),
(454, 'Irec�', 5),
(455, 'Itabela', 5),
(456, 'Itaberaba', 5),
(457, 'Itabuna', 5),
(458, 'Itacar�', 5),
(459, 'Itaet�', 5),
(460, 'Itagi', 5),
(461, 'Itagib�', 5),
(462, 'Itagimirim', 5),
(463, 'Itagua�u da Bahia', 5),
(464, 'Itaju do Col�nia', 5),
(465, 'Itaju�pe', 5),
(466, 'Itamaraju', 5),
(467, 'Itamari', 5),
(468, 'Itamb�', 5),
(469, 'Itanagra', 5),
(470, 'Itanh�m', 5),
(471, 'Itaparica', 5),
(472, 'Itap�', 5),
(473, 'Itapebi', 5),
(474, 'Itapetinga', 5),
(475, 'Itapicuru', 5),
(476, 'Itapitanga', 5),
(477, 'Itaquara', 5),
(478, 'Itarantim', 5),
(479, 'Itatim', 5),
(480, 'Itiru�u', 5),
(481, 'Iti�ba', 5),
(482, 'Itoror�', 5),
(483, 'Itua�u', 5),
(484, 'Ituber�', 5),
(485, 'Iui�', 5),
(486, 'Jaborandi', 5),
(487, 'Jacaraci', 5),
(488, 'Jacobina', 5),
(489, 'Jaguaquara', 5),
(490, 'Jaguarari', 5),
(491, 'Jaguaripe', 5),
(492, 'Janda�ra', 5),
(493, 'Jequi�', 5),
(494, 'Jeremoabo', 5),
(495, 'Jiquiri��', 5),
(496, 'Jita�na', 5),
(497, 'Jo�o Dourado', 5),
(498, 'Juazeiro', 5),
(499, 'Jucuru�u', 5),
(500, 'Jussara', 5),
(501, 'Jussari', 5),
(502, 'Jussiape', 5),
(503, 'Lafaiete Coutinho', 5),
(504, 'Lagoa Real', 5),
(505, 'Laje', 5),
(506, 'Lajed�o', 5),
(507, 'Lajedinho', 5),
(508, 'Lajedo do Tabocal', 5),
(509, 'Lamar�o', 5),
(510, 'Lap�o', 5),
(511, 'Lauro de Freitas', 5),
(512, 'Len��is', 5),
(513, 'Lic�nio de Almeida', 5),
(514, 'Livramento de Nossa Senhora', 5),
(515, 'Lu�s Eduardo Magalh�es', 5),
(516, 'Macajuba', 5),
(517, 'Macarani', 5),
(518, 'Maca�bas', 5),
(519, 'Macurur�', 5),
(520, 'Madre de Deus', 5),
(521, 'Maetinga', 5),
(522, 'Maiquinique', 5),
(523, 'Mairi', 5),
(524, 'Malhada', 5),
(525, 'Malhada de Pedras', 5),
(526, 'Manoel Vitorino', 5),
(527, 'Mansid�o', 5),
(528, 'Marac�s', 5),
(529, 'Maragogipe', 5),
(530, 'Mara�', 5),
(531, 'Marcion�lio Souza', 5),
(532, 'Mascote', 5),
(533, 'Mata de S�o Jo�o', 5),
(534, 'Matina', 5),
(535, 'Medeiros Neto', 5),
(536, 'Miguel Calmon', 5),
(537, 'Milagres', 5),
(538, 'Mirangaba', 5),
(539, 'Mirante', 5),
(540, 'Monte Santo', 5),
(541, 'Morpar�', 5),
(542, 'Morro do Chap�u', 5),
(543, 'Mortugaba', 5),
(544, 'Mucug�', 5),
(545, 'Mucuri', 5),
(546, 'Mulungu do Morro', 5),
(547, 'Mundo Novo', 5),
(548, 'Muniz Ferreira', 5),
(549, 'Muqu�m de S�o Francisco', 5),
(550, 'Muritiba', 5),
(551, 'Mutu�pe', 5),
(552, 'Nazar�', 5),
(553, 'Nilo Pe�anha', 5),
(554, 'Nordestina', 5),
(555, 'Nova Cana�', 5),
(556, 'Nova F�tima', 5),
(557, 'Nova Ibi�', 5),
(558, 'Nova Itarana', 5),
(559, 'Nova Reden��o', 5),
(560, 'Nova Soure', 5),
(561, 'Nova Vi�osa', 5),
(562, 'Novo Horizonte', 5),
(563, 'Novo Triunfo', 5),
(564, 'Olindina', 5),
(565, 'Oliveira dos Brejinhos', 5),
(566, 'Ouri�angas', 5),
(567, 'Ourol�ndia', 5),
(568, 'Palmas de Monte Alto', 5),
(569, 'Palmeiras', 5),
(570, 'Paramirim', 5),
(571, 'Paratinga', 5),
(572, 'Paripiranga', 5),
(573, 'Pau Brasil', 5),
(574, 'Paulo Afonso', 5),
(575, 'P� de Serra', 5),
(576, 'Pedr�o', 5),
(577, 'Pedro Alexandre', 5),
(578, 'Piat�', 5),
(579, 'Pil�o Arcado', 5),
(580, 'Pinda�', 5),
(581, 'Pindoba�u', 5),
(582, 'Pintadas', 5),
(583, 'Pira� do Norte', 5),
(584, 'Pirip�', 5),
(585, 'Piritiba', 5),
(586, 'Planaltino', 5),
(587, 'Planalto', 5),
(588, 'Po��es', 5),
(589, 'Pojuca', 5),
(590, 'Ponto Novo', 5),
(591, 'Porto Seguro', 5),
(592, 'Potiragu�', 5),
(593, 'Prado', 5),
(594, 'Presidente Dutra', 5),
(595, 'Presidente J�nio Quadros', 5),
(596, 'Presidente Tancredo Neves', 5),
(597, 'Queimadas', 5),
(598, 'Quijingue', 5),
(599, 'Quixabeira', 5),
(600, 'Rafael Jambeiro', 5),
(601, 'Remanso', 5),
(602, 'Retirol�ndia', 5),
(603, 'Riach�o das Neves', 5),
(604, 'Riach�o do Jacu�pe', 5),
(605, 'Riacho de Santana', 5),
(606, 'Ribeira do Amparo', 5),
(607, 'Ribeira do Pombal', 5),
(608, 'Ribeir�o do Largo', 5),
(609, 'Rio de Contas', 5),
(610, 'Rio do Ant�nio', 5),
(611, 'Rio do Pires', 5),
(612, 'Rio Real', 5),
(613, 'Rodelas', 5),
(614, 'Ruy Barbosa', 5),
(615, 'Salinas da Margarida', 5),
(616, 'Salvador', 5),
(617, 'Santa B�rbara', 5),
(618, 'Santa Br�gida', 5),
(619, 'Santa Cruz Cabr�lia', 5),
(620, 'Santa Cruz da Vit�ria', 5),
(621, 'Santa In�s', 5),
(622, 'Santa Luzia', 5),
(623, 'Santa Maria da Vit�ria', 5),
(624, 'Santa Rita de C�ssia', 5),
(625, 'Santa Teresinha', 5),
(626, 'Santaluz', 5),
(627, 'Santana', 5),
(628, 'Santan�polis', 5),
(629, 'Santo Amaro', 5),
(630, 'Santo Ant�nio de Jesus', 5),
(631, 'Santo Est�v�o', 5),
(632, 'S�o Desid�rio', 5),
(633, 'S�o Domingos', 5),
(634, 'S�o Felipe', 5),
(635, 'S�o F�lix', 5),
(636, 'S�o F�lix do Coribe', 5),
(637, 'S�o Francisco do Conde', 5),
(638, 'S�o Gabriel', 5),
(639, 'S�o Gon�alo dos Campos', 5),
(640, 'S�o Jos� da Vit�ria', 5),
(641, 'S�o Jos� do Jacu�pe', 5),
(642, 'S�o Miguel das Matas', 5),
(643, 'S�o Sebasti�o do Pass�', 5),
(644, 'Sapea�u', 5),
(645, 'S�tiro Dias', 5),
(646, 'Saubara', 5),
(647, 'Sa�de', 5),
(648, 'Seabra', 5),
(649, 'Sebasti�o Laranjeiras', 5),
(650, 'Senhor do Bonfim', 5),
(651, 'Sento S�', 5),
(652, 'Serra do Ramalho', 5),
(653, 'Serra Dourada', 5),
(654, 'Serra Preta', 5),
(655, 'Serrinha', 5),
(656, 'Serrol�ndia', 5),
(657, 'Sim�es Filho', 5),
(658, 'S�tio do Mato', 5),
(659, 'S�tio do Quinto', 5),
(660, 'Sobradinho', 5),
(661, 'Souto Soares', 5),
(662, 'Tabocas do Brejo Velho', 5),
(663, 'Tanha�u', 5),
(664, 'Tanque Novo', 5),
(665, 'Tanquinho', 5),
(666, 'Tapero�', 5),
(667, 'Tapiramut�', 5),
(668, 'Teixeira de Freitas', 5),
(669, 'Teodoro Sampaio', 5),
(670, 'Teofil�ndia', 5),
(671, 'Teol�ndia', 5),
(672, 'Terra Nova', 5),
(673, 'Tremedal', 5),
(674, 'Tucano', 5),
(675, 'Uau�', 5),
(676, 'Uba�ra', 5),
(677, 'Ubaitaba', 5),
(678, 'Ubat�', 5),
(679, 'Uiba�', 5),
(680, 'Umburanas', 5),
(681, 'Una', 5),
(682, 'Urandi', 5),
(683, 'Uru�uca', 5),
(684, 'Utinga', 5),
(685, 'Valen�a', 5),
(686, 'Valente', 5),
(687, 'V�rzea da Ro�a', 5),
(688, 'V�rzea do Po�o', 5),
(689, 'V�rzea Nova', 5),
(690, 'Varzedo', 5),
(691, 'Vera Cruz', 5),
(692, 'Vereda', 5),
(693, 'Vit�ria da Conquista', 5),
(694, 'Wagner', 5),
(695, 'Wanderley', 5),
(696, 'Wenceslau Guimar�es', 5),
(697, 'Xique-Xique', 5),
(698, 'Abaiara', 6),
(699, 'Acarape', 6),
(700, 'Acara�', 6),
(701, 'Acopiara', 6),
(702, 'Aiuaba', 6),
(703, 'Alc�ntaras', 6),
(704, 'Altaneira', 6),
(705, 'Alto Santo', 6),
(706, 'Amontada', 6),
(707, 'Antonina do Norte', 6),
(708, 'Apuiar�s', 6),
(709, 'Aquiraz', 6),
(710, 'Aracati', 6),
(711, 'Aracoiaba', 6),
(712, 'Ararend�', 6),
(713, 'Araripe', 6),
(714, 'Aratuba', 6),
(715, 'Arneiroz', 6),
(716, 'Assar�', 6),
(717, 'Aurora', 6),
(718, 'Baixio', 6),
(719, 'Banabui�', 6),
(720, 'Barbalha', 6),
(721, 'Barreira', 6),
(722, 'Barro', 6),
(723, 'Barroquinha', 6),
(724, 'Baturit�', 6),
(725, 'Beberibe', 6),
(726, 'Bela Cruz', 6),
(727, 'Boa Viagem', 6),
(728, 'Brejo Santo', 6),
(729, 'Camocim', 6),
(730, 'Campos Sales', 6),
(731, 'Canind�', 6),
(732, 'Capistrano', 6),
(733, 'Caridade', 6),
(734, 'Carir�', 6),
(735, 'Cariria�u', 6),
(736, 'Cari�s', 6),
(737, 'Carnaubal', 6),
(738, 'Cascavel', 6),
(739, 'Catarina', 6),
(740, 'Catunda', 6),
(741, 'Caucaia', 6),
(742, 'Cedro', 6),
(743, 'Chaval', 6),
(744, 'Chor�', 6),
(745, 'Chorozinho', 6),
(746, 'Corea�', 6),
(747, 'Crate�s', 6),
(748, 'Crato', 6),
(749, 'Croat�', 6),
(750, 'Cruz', 6),
(751, 'Deputado Irapuan Pinheiro', 6),
(752, 'Erer�', 6),
(753, 'Eus�bio', 6),
(754, 'Farias Brito', 6),
(755, 'Forquilha', 6),
(756, 'Fortaleza', 6),
(757, 'Fortim', 6),
(758, 'Frecheirinha', 6),
(759, 'General Sampaio', 6),
(760, 'Gra�a', 6),
(761, 'Granja', 6),
(762, 'Granjeiro', 6),
(763, 'Groa�ras', 6),
(764, 'Guai�ba', 6),
(765, 'Guaraciaba do Norte', 6),
(766, 'Guaramiranga', 6),
(767, 'Hidrol�ndia', 6),
(768, 'Horizonte', 6),
(769, 'Ibaretama', 6),
(770, 'Ibiapina', 6),
(771, 'Ibicuitinga', 6),
(772, 'Icapu�', 6),
(773, 'Ic�', 6),
(774, 'Iguatu', 6),
(775, 'Independ�ncia', 6),
(776, 'Ipaporanga', 6),
(777, 'Ipaumirim', 6),
(778, 'Ipu', 6),
(779, 'Ipueiras', 6),
(780, 'Iracema', 6),
(781, 'Irau�uba', 6),
(782, 'Itai�aba', 6),
(783, 'Itaitinga', 6),
(784, 'Itapag�', 6),
(785, 'Itapipoca', 6),
(786, 'Itapi�na', 6),
(787, 'Itarema', 6),
(788, 'Itatira', 6),
(789, 'Jaguaretama', 6),
(790, 'Jaguaribara', 6),
(791, 'Jaguaribe', 6),
(792, 'Jaguaruana', 6),
(793, 'Jardim', 6),
(794, 'Jati', 6),
(795, 'Jijoca de Jericoacoara', 6),
(796, 'Juazeiro do Norte', 6),
(797, 'Juc�s', 6),
(798, 'Lavras da Mangabeira', 6),
(799, 'Limoeiro do Norte', 6),
(800, 'Madalena', 6),
(801, 'Maracana�', 6),
(802, 'Maranguape', 6),
(803, 'Marco', 6),
(804, 'Martin�pole', 6),
(805, 'Massap�', 6),
(806, 'Mauriti', 6),
(807, 'Meruoca', 6),
(808, 'Milagres', 6),
(809, 'Milh�', 6),
(810, 'Mira�ma', 6),
(811, 'Miss�o Velha', 6),
(812, 'Momba�a', 6),
(813, 'Monsenhor Tabosa', 6),
(814, 'Morada Nova', 6),
(815, 'Mora�jo', 6),
(816, 'Morrinhos', 6),
(817, 'Mucambo', 6),
(818, 'Mulungu', 6),
(819, 'Nova Olinda', 6),
(820, 'Nova Russas', 6),
(821, 'Novo Oriente', 6),
(822, 'Ocara', 6),
(823, 'Or�s', 6),
(824, 'Pacajus', 6),
(825, 'Pacatuba', 6),
(826, 'Pacoti', 6),
(827, 'Pacuj�', 6),
(828, 'Palhano', 6),
(829, 'Palm�cia', 6),
(830, 'Paracuru', 6),
(831, 'Paraipaba', 6),
(832, 'Parambu', 6),
(833, 'Paramoti', 6),
(834, 'Pedra Branca', 6),
(835, 'Penaforte', 6),
(836, 'Pentecoste', 6),
(837, 'Pereiro', 6),
(838, 'Pindoretama', 6),
(839, 'Piquet Carneiro', 6),
(840, 'Pires Ferreira', 6),
(841, 'Poranga', 6),
(842, 'Porteiras', 6),
(843, 'Potengi', 6),
(844, 'Potiretama', 6),
(845, 'Quiterian�polis', 6),
(846, 'Quixad�', 6),
(847, 'Quixel�', 6),
(848, 'Quixeramobim', 6),
(849, 'Quixer�', 6),
(850, 'Reden��o', 6),
(851, 'Reriutaba', 6),
(852, 'Russas', 6),
(853, 'Saboeiro', 6),
(854, 'Salitre', 6),
(855, 'Santa Quit�ria', 6),
(856, 'Santana do Acara�', 6),
(857, 'Santana do Cariri', 6),
(858, 'S�o Benedito', 6),
(859, 'S�o Gon�alo do Amarante', 6),
(860, 'S�o Jo�o do Jaguaribe', 6),
(861, 'S�o Lu�s do Curu', 6),
(862, 'Senador Pompeu', 6),
(863, 'Senador S�', 6),
(864, 'Sobral', 6),
(865, 'Solon�pole', 6),
(866, 'Tabuleiro do Norte', 6),
(867, 'Tamboril', 6),
(868, 'Tarrafas', 6),
(869, 'Tau�', 6),
(870, 'Teju�uoca', 6),
(871, 'Tiangu�', 6),
(872, 'Trairi', 6),
(873, 'Tururu', 6),
(874, 'Ubajara', 6),
(875, 'Umari', 6),
(876, 'Umirim', 6),
(877, 'Uruburetama', 6),
(878, 'Uruoca', 6),
(879, 'Varjota', 6),
(880, 'V�rzea Alegre', 6),
(881, 'Vi�osa do Cear�', 6),
(882, 'Bras�lia', 7),
(883, 'Abadia de Goi�s', 9),
(884, 'Abadi�nia', 9),
(885, 'Acre�na', 9),
(886, 'Adel�ndia', 9),
(887, '�gua Fria de Goi�s', 9),
(888, '�gua Limpa', 9),
(889, '�guas Lindas de Goi�s', 9),
(890, 'Alex�nia', 9),
(891, 'Alo�ndia', 9),
(892, 'Alto Horizonte', 9),
(893, 'Alto Para�so de Goi�s', 9),
(894, 'Alvorada do Norte', 9),
(895, 'Amaralina', 9),
(896, 'Americano do Brasil', 9),
(897, 'Amorin�polis', 9),
(898, 'An�polis', 9),
(899, 'Anhanguera', 9),
(900, 'Anicuns', 9),
(901, 'Aparecida de Goi�nia', 9),
(902, 'Aparecida do Rio Doce', 9),
(903, 'Apor�', 9),
(904, 'Ara�u', 9),
(905, 'Aragar�as', 9),
(906, 'Aragoi�nia', 9),
(907, 'Araguapaz', 9),
(908, 'Aren�polis', 9),
(909, 'Aruan�', 9),
(910, 'Auril�ndia', 9),
(911, 'Avelin�polis', 9),
(912, 'Baliza', 9),
(913, 'Barro Alto', 9),
(914, 'Bela Vista de Goi�s', 9),
(915, 'Bom Jardim de Goi�s', 9),
(916, 'Bom Jesus de Goi�s', 9),
(917, 'Bonfin�polis', 9),
(918, 'Bon�polis', 9),
(919, 'Brazabrantes', 9),
(920, 'Brit�nia', 9),
(921, 'Buriti Alegre', 9),
(922, 'Buriti de Goi�s', 9),
(923, 'Buritin�polis', 9),
(924, 'Cabeceiras', 9),
(925, 'Cachoeira Alta', 9),
(926, 'Cachoeira de Goi�s', 9),
(927, 'Cachoeira Dourada', 9),
(928, 'Ca�u', 9),
(929, 'Caiap�nia', 9),
(930, 'Caldas Novas', 9),
(931, 'Caldazinha', 9),
(932, 'Campestre de Goi�s', 9),
(933, 'Campina�u', 9),
(934, 'Campinorte', 9),
(935, 'Campo Alegre de Goi�s', 9),
(936, 'Campo Limpo de Goi�s', 9),
(937, 'Campos Belos', 9),
(938, 'Campos Verdes', 9),
(939, 'Carmo do Rio Verde', 9),
(940, 'Castel�ndia', 9),
(941, 'Catal�o', 9),
(942, 'Catura�', 9),
(943, 'Cavalcante', 9),
(944, 'Ceres', 9),
(945, 'Cezarina', 9),
(946, 'Chapad�o do C�u', 9),
(947, 'Cidade Ocidental', 9),
(948, 'Cocalzinho de Goi�s', 9),
(949, 'Colinas do Sul', 9),
(950, 'C�rrego do Ouro', 9),
(951, 'Corumb� de Goi�s', 9),
(952, 'Corumba�ba', 9),
(953, 'Cristalina', 9),
(954, 'Cristian�polis', 9),
(955, 'Crix�s', 9),
(956, 'Crom�nia', 9),
(957, 'Cumari', 9),
(958, 'Damian�polis', 9),
(959, 'Damol�ndia', 9),
(960, 'Davin�polis', 9),
(961, 'Diorama', 9),
(962, 'Divin�polis de Goi�s', 9),
(963, 'Doverl�ndia', 9),
(964, 'Edealina', 9),
(965, 'Ed�ia', 9),
(966, 'Estrela do Norte', 9),
(967, 'Faina', 9),
(968, 'Fazenda Nova', 9),
(969, 'Firmin�polis', 9),
(970, 'Flores de Goi�s', 9),
(971, 'Formosa', 9),
(972, 'Formoso', 9),
(973, 'Gameleira de Goi�s', 9),
(974, 'Goian�polis', 9),
(975, 'Goiandira', 9),
(976, 'Goian�sia', 9),
(977, 'Goi�nia', 9),
(978, 'Goianira', 9),
(979, 'Goi�s', 9),
(980, 'Goiatuba', 9),
(981, 'Gouvel�ndia', 9),
(982, 'Guap�', 9),
(983, 'Guara�ta', 9),
(984, 'Guarani de Goi�s', 9),
(985, 'Guarinos', 9),
(986, 'Heitora�', 9),
(987, 'Hidrol�ndia', 9),
(988, 'Hidrolina', 9),
(989, 'Iaciara', 9),
(990, 'Inaciol�ndia', 9),
(991, 'Indiara', 9),
(992, 'Inhumas', 9),
(993, 'Ipameri', 9),
(994, 'Ipiranga de Goi�s', 9),
(995, 'Ipor�', 9),
(996, 'Israel�ndia', 9),
(997, 'Itabera�', 9),
(998, 'Itaguari', 9),
(999, 'Itaguaru', 9);

SELECT cidades.nome AS 'CIDADES', COUNT(*)
FROM cidades
INNER JOIN estados on estados.idEstado = cidades.idCidade
group by cidades.nome