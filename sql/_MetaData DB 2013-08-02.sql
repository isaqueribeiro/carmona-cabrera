# SQL Manager Lite for MySQL 5.3.1.7
# ---------------------------------------
# Host     : localhost
# Port     : 3306
# Database : tkce


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE `tkce`
    CHARACTER SET 'utf8'
    COLLATE 'utf8_general_ci';

USE `tkce`;

SET sql_mode = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';

#
# Structure for the `mny_caixa` table : 
#

CREATE TABLE `mny_caixa` (
  `cax_num` INTEGER(11) NOT NULL COMMENT '- Numero',
  `cax_usuario` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Usuario',
  `cax_data` DATE DEFAULT NULL COMMENT '- Data',
  `cax_hora` TIME DEFAULT NULL COMMENT '- Hora',
  `uni_codigo` SMALLINT(6) DEFAULT NULL,
  `cax_status` SMALLINT(6) DEFAULT NULL,
  `cax_credito` DECIMAL(15,2) DEFAULT NULL,
  `cax_debito` DECIMAL(15,2) DEFAULT NULL,
  `cax_estorno` DECIMAL(15,2) DEFAULT NULL,
  `cax_transf` DECIMAL(15,2) DEFAULT NULL,
  `cax_saldo` DECIMAL(15,2) DEFAULT NULL,
  PRIMARY KEY USING BTREE (`cax_num`)
)ENGINE=InnoDB
AVG_ROW_LENGTH=468 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB';

#
# Structure for the `mny_caixa_conta` table : 
#

CREATE TABLE `mny_caixa_conta` (
  `cax_num` INTEGER(11) NOT NULL COMMENT '- Numero',
  `ccr_codigo` SMALLINT(6) NOT NULL COMMENT '- Conta Corrente',
  `cax_saldo` DECIMAL(15,2) DEFAULT NULL COMMENT '- Saldo',
  `cax_tipo` CHAR(1) COLLATE utf8_general_ci DEFAULT NULL COMMENT 'P/R',
  PRIMARY KEY USING BTREE (`cax_num`, `ccr_codigo`)
)ENGINE=InnoDB
AVG_ROW_LENGTH=86 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB';

#
# Structure for the `mny_caixa_item` table : 
#

CREATE TABLE `mny_caixa_item` (
  `cax_num` INTEGER(11) NOT NULL COMMENT '- Numero',
  `cax_seq` SMALLINT(6) NOT NULL COMMENT '- Seq',
  `mov_codigo` INTEGER(11) DEFAULT NULL COMMENT '- Movimento',
  `mov_item` SMALLINT(6) DEFAULT NULL COMMENT '- Item',
  `cax_dce` VARCHAR(1) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- C/D/E',
  `ccr_codigo` SMALLINT(6) DEFAULT NULL COMMENT '- Conta',
  `cax_historico` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Historico',
  `cax_favorecido` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Favorecido',
  `cax_valor` DECIMAL(15,2) DEFAULT NULL COMMENT '- Valor Pago',
  `cax_imp` SMALLINT(6) DEFAULT NULL COMMENT '- Orgem Impressao',
  PRIMARY KEY USING BTREE (`cax_num`, `cax_seq`)
)ENGINE=InnoDB
AVG_ROW_LENGTH=97 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB';

#
# Structure for the `mny_centro_custo` table : 
#

CREATE TABLE `mny_centro_custo` (
  `cen_codigo` SMALLINT(6) NOT NULL COMMENT '- Codigo',
  `cen_nome` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Nome',
  `cen_inc` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Inclusao',
  `cen_alt` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Alteracao',
  PRIMARY KEY USING BTREE (`cen_codigo`)
)ENGINE=InnoDB
AVG_ROW_LENGTH=4096 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB';

#
# Structure for the `mny_centro_negocio` table : 
#

CREATE TABLE `mny_centro_negocio` (
  `neg_codigo` SMALLINT(6) NOT NULL COMMENT '- Codigo',
  `neg_nome` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Nome',
  `neg_inc` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Inclusao',
  `neg_alt` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Alteracao',
  PRIMARY KEY USING BTREE (`neg_codigo`)
)ENGINE=InnoDB
AVG_ROW_LENGTH=5461 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB';

#
# Structure for the `mny_totalizador` table : 
#

CREATE TABLE `mny_totalizador` (
  `tot_codigo` SMALLINT(6) NOT NULL COMMENT '- Codigo',
  `tot_nome` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Nome',
  `tot_ordem` SMALLINT(6) DEFAULT NULL COMMENT '- Ordem Relatorio',
  `tot_inc` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Inclusao',
  `tot_alt` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Alteracao',
  PRIMARY KEY USING BTREE (`tot_codigo`)
)ENGINE=InnoDB
AVG_ROW_LENGTH=5461 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB';

#
# Structure for the `mny_orcamento` table : 
#

CREATE TABLE `mny_orcamento` (
  `orc_codigo` SMALLINT(6) NOT NULL COMMENT '- Codigo',
  `orc_nome` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Nome',
  `orc_operacao` VARCHAR(1) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- R/D',
  `tot_codigo` SMALLINT(6) DEFAULT NULL COMMENT '- Codigo Totalizador',
  `orc_inc` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Inclusao',
  `orc_alt` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Alteracao',
  PRIMARY KEY USING BTREE (`orc_codigo`),
   INDEX `tot_codigo` USING BTREE (`tot_codigo`),
  CONSTRAINT `mny_orcamento_fk1` FOREIGN KEY (`tot_codigo`) REFERENCES `mny_totalizador` (`tot_codigo`)
)ENGINE=InnoDB
AVG_ROW_LENGTH=8192 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB; (`tot_codigo`) REFER `tkce/mny_totalizador`(`tot_codigo`)';

#
# Structure for the `mny_conta` table : 
#

CREATE TABLE `mny_conta` (
  `con_codigo` SMALLINT(6) NOT NULL COMMENT '- Codigo',
  `con_nome` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Nome',
  `orc_codigo` SMALLINT(6) DEFAULT NULL COMMENT '- Codigo Orcamento',
  `con_inc` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Inclusao',
  `con_alt` VARCHAR(60) COLLATE utf8_general_ci DEFAULT '- Alteracao',
  PRIMARY KEY USING BTREE (`con_codigo`),
   INDEX `orc_codigo` USING BTREE (`orc_codigo`),
  CONSTRAINT `mny_conta_fk1` FOREIGN KEY (`orc_codigo`) REFERENCES `mny_orcamento` (`orc_codigo`)
)ENGINE=InnoDB
AVG_ROW_LENGTH=4096 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB; (`orc_codigo`) REFER `tkce/mny_orcamento`(`orc_codigo`)';

#
# Structure for the `sys_banco` table : 
#

CREATE TABLE `sys_banco` (
  `bco_codigo` SMALLINT(6) NOT NULL COMMENT '- Codigo',
  `bco_nome` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Nome',
  `bco_sigla` VARCHAR(10) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Sigla',
  `bco_inc` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Inclusao',
  `bco_alt` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Alteracao',
  PRIMARY KEY USING BTREE (`bco_codigo`)
)ENGINE=InnoDB
AVG_ROW_LENGTH=120 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB';

#
# Structure for the `mny_conta_corrente` table : 
#

CREATE TABLE `mny_conta_corrente` (
  `ccr_codigo` SMALLINT(6) NOT NULL COMMENT '- Codigo',
  `ccr_agencia` VARCHAR(10) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Agencia',
  `ccr_agencia_dv` VARCHAR(3) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Digito Verificador Agencia',
  `ccr_conta` VARCHAR(10) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Conta',
  `ccr_conta_dv` VARCHAR(3) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Digito Verificador Conta',
  `ccr_tipo` SMALLINT(6) DEFAULT 0 COMMENT '- Tipo:\r\n0 - Conta Corrente\r\n1 - Conta Salario\r\n2 - Conta Poupanca\r\n3 - Outra Contas',
  `ban_codigo` SMALLINT(6) DEFAULT NULL COMMENT '- Banco',
  `ccr_inc` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Inclusao',
  `ccr_alt` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Alteracao',
  `ccr_caixa` SMALLINT(6) DEFAULT NULL COMMENT 'Conta Caixa\r\n:0 - Não\r\n:1 - Sim',
  PRIMARY KEY USING BTREE (`ccr_codigo`),
   INDEX `ban_codigo` USING BTREE (`ban_codigo`),
  CONSTRAINT `mny_conta_corrente_fk1` FOREIGN KEY (`ban_codigo`) REFERENCES `sys_banco` (`bco_codigo`)
)ENGINE=InnoDB
AVG_ROW_LENGTH=8192 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB; (`ban_codigo`) REFER `tkce/sys_banco`(`bco_codigo`)';

#
# Structure for the `mny_custo` table : 
#

CREATE TABLE `mny_custo` (
  `cus_codigo` SMALLINT(6) NOT NULL COMMENT '- Codigo',
  `cus_nome` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Nome',
  `cus_inc` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Inclusao',
  `cus_alt` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Alteracao',
  PRIMARY KEY USING BTREE (`cus_codigo`)
)ENGINE=InnoDB
AVG_ROW_LENGTH=5461 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB';

#
# Structure for the `mny_forma_pagto` table : 
#

CREATE TABLE `mny_forma_pagto` (
  `fpg_codigo` SMALLINT(6) NOT NULL COMMENT '- Codigo',
  `fpg_nome` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Nome',
  `fpg_inc` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Inclusao',
  `fpg_alt` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Alteracao',
  PRIMARY KEY USING BTREE (`fpg_codigo`)
)ENGINE=InnoDB
AVG_ROW_LENGTH=4096 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB';

#
# Structure for the `mny_tipo_aceite` table : 
#

CREATE TABLE `mny_tipo_aceite` (
  `tip_codigo` SMALLINT(6) NOT NULL COMMENT '- Codigo',
  `tip_nome` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Nome',
  `tip_inc` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Inclusao',
  `tip_alt` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Alteracao',
  PRIMARY KEY USING BTREE (`tip_codigo`)
)ENGINE=InnoDB
AVG_ROW_LENGTH=4096 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB';

#
# Structure for the `mny_unidade` table : 
#

CREATE TABLE `mny_unidade` (
  `uni_codigo` SMALLINT(6) NOT NULL COMMENT '- Codigo',
  `uni_nome` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Nome',
  `uni_possui_almox` SMALLINT(6) NOT NULL DEFAULT 0 COMMENT '- Unidade possui Almoxarifado:\r\n0 - Nao\r\n1 - Sim',
  `uni_inc` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Inclusao',
  `uni_alt` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Alteracao',
  PRIMARY KEY USING BTREE (`uni_codigo`)
)ENGINE=InnoDB
AVG_ROW_LENGTH=5461 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB';

#
# Structure for the `sys_pais` table : 
#

CREATE TABLE `sys_pais` (
  `pai_codigo` VARCHAR(5) COLLATE utf8_general_ci NOT NULL,
  `pai_nome` VARCHAR(250) COLLATE utf8_general_ci DEFAULT NULL,
  `pai_iso` VARCHAR(3) COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`pai_codigo`)
)ENGINE=InnoDB
AVG_ROW_LENGTH=67 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB';

#
# Structure for the `sys_estado` table : 
#

CREATE TABLE `sys_estado` (
  `est_codigo` SMALLINT(6) NOT NULL,
  `est_pais` VARCHAR(5) COLLATE utf8_general_ci NOT NULL,
  `est_nome` VARCHAR(150) COLLATE utf8_general_ci DEFAULT NULL,
  `est_sigla` VARCHAR(3) COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`est_codigo`),
   INDEX `est_pais` USING BTREE (`est_pais`),
  CONSTRAINT `fk_estado_pais` FOREIGN KEY (`est_pais`) REFERENCES `sys_pais` (`pai_codigo`) ON UPDATE CASCADE
)ENGINE=InnoDB
AVG_ROW_LENGTH=606 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB; (`est_pais`) REFER `tkce/sys_pais`(`pai_codigo`) ON UPDAT';

#
# Structure for the `sys_cidade` table : 
#

CREATE TABLE `sys_cidade` (
  `cid_codigo` INTEGER(11) NOT NULL,
  `cid_estado` SMALLINT(6) NOT NULL,
  `cid_nome` VARCHAR(150) COLLATE utf8_general_ci DEFAULT NULL,
  `cid_cep_inicial` VARCHAR(15) COLLATE utf8_general_ci DEFAULT NULL,
  `cid_cep_final` VARCHAR(15) COLLATE utf8_general_ci DEFAULT NULL,
  `cid_ddd` SMALLINT(6) DEFAULT NULL,
  PRIMARY KEY USING BTREE (`cid_codigo`),
   INDEX `cid_estado` USING BTREE (`cid_estado`),
  CONSTRAINT `fk_cidade_estado` FOREIGN KEY (`cid_estado`) REFERENCES `sys_estado` (`est_codigo`) ON UPDATE CASCADE
)ENGINE=InnoDB
AVG_ROW_LENGTH=65 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB; (`cid_estado`) REFER `tkce/sys_estado`(`est_codigo`) ON U';

#
# Structure for the `mny_pessoa` table : 
#

CREATE TABLE `mny_pessoa` (
  `pes_codigo` INTEGER(11) NOT NULL COMMENT '- Codigo',
  `tip_codigo` SMALLINT(6) DEFAULT NULL COMMENT '- Tipo',
  `pes_documento` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- CNPJ/CPF',
  `pes_razao_social` VARCHAR(200) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Razao Social',
  `pes_nome_fantasia` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Nome/Fantasia',
  `pes_insc_municipal` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Inscricao Municipal',
  `pes_insc_estadual` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Inscricao Estadual',
  `pes_contato` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Contato',
  `pes_fones` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Fones',
  `pes_end_logra` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Logradouro',
  `pes_end_cidade` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Cidade',
  `pes_end_bairro` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Bairro',
  `pes_end_cep` VARCHAR(8) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- CEP',
  `pes_end_uf` VARCHAR(2) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- UF',
  `cid_codigo` INTEGER(11) DEFAULT NULL COMMENT '- Cidade (Codigo IBGE)',
  `pes_obs` VARCHAR(300) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- OBS',
  `pes_email` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- E-mail',
  `ccr_codigo` SMALLINT(6) DEFAULT NULL COMMENT '- Conta Corrente',
  `pes_inc` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Inclusao',
  `pes_alt` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Alteracao',
  `pes_status` SMALLINT(6) DEFAULT NULL COMMENT '1 - Ativo\r\n0 - Inativo',
  `pes_ult_datamov` DATETIME DEFAULT NULL COMMENT '- Data da ultima movimentacao.',
  PRIMARY KEY USING BTREE (`pes_codigo`),
   INDEX `cid_codigo` USING BTREE (`cid_codigo`),
  CONSTRAINT `fk_pessoa_cidade` FOREIGN KEY (`cid_codigo`) REFERENCES `sys_cidade` (`cid_codigo`) ON UPDATE CASCADE
)ENGINE=InnoDB
AVG_ROW_LENGTH=5461 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB; (`cid_codigo`) REFER `tkce/sys_cidade`(`cid_codigo`) ON U';

#
# Structure for the `mny_setor` table : 
#

CREATE TABLE `mny_setor` (
  `set_codigo` SMALLINT(6) NOT NULL COMMENT '- Codigo',
  `set_nome` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Nome',
  `set_gerente` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Gerente',
  `set_inc` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Inclusao',
  `set_alt` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Alteracao',
  PRIMARY KEY USING BTREE (`set_codigo`)
)ENGINE=InnoDB
AVG_ROW_LENGTH=5461 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB';

#
# Structure for the `sys_situacao` table : 
#

CREATE TABLE `sys_situacao` (
  `sit_codigo` SMALLINT(6) NOT NULL COMMENT '- Codigo',
  `sit_nome` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Nome',
  `sit_inc` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Inclusao',
  `sit_alt` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Alteracao',
  PRIMARY KEY USING BTREE (`sit_codigo`)
)ENGINE=InnoDB
AVG_ROW_LENGTH=3276 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB';

#
# Structure for the `sys_competencia` table : 
#

CREATE TABLE `sys_competencia` (
  `com_codigo` SMALLINT(6) NOT NULL COMMENT '- Codigo',
  `com_nome` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Nome',
  `com_ano_mes` INTEGER(11) DEFAULT NULL COMMENT '- Ano/Mes',
  `sit_codigo` SMALLINT(6) DEFAULT NULL COMMENT '- Situacao',
  `com_inc` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Inclusao',
  `com_alt` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Alteracao',
  PRIMARY KEY USING BTREE (`com_codigo`)
)ENGINE=InnoDB
AVG_ROW_LENGTH=8192 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB';

#
# Structure for the `mny_movimento` table : 
#

CREATE TABLE `mny_movimento` (
  `mov_codigo` INTEGER(11) NOT NULL COMMENT '- Codigo',
  `mov_data_inclusao` DATE DEFAULT NULL COMMENT '- Data Inclusao',
  `mov_data_emissao` DATE DEFAULT NULL COMMENT '- Data Emissao',
  `cus_codigo` SMALLINT(6) DEFAULT NULL COMMENT '- Tipo de Custo',
  `neg_codigo` SMALLINT(6) DEFAULT NULL COMMENT '- Centro de Negocios',
  `cen_codigo` SMALLINT(6) DEFAULT NULL COMMENT '- Centro de Custo',
  `uni_codigo` SMALLINT(6) DEFAULT NULL COMMENT '- Unidade de Negocios',
  `pes_codigo` INTEGER(11) DEFAULT NULL COMMENT '- Pessoa',
  `con_codigo` SMALLINT(6) DEFAULT NULL COMMENT '- Conta',
  `set_codigo` SMALLINT(6) DEFAULT NULL COMMENT '- Setor',
  `sit_codigo` SMALLINT(6) DEFAULT NULL COMMENT '- Situacao',
  `com_codigo` SMALLINT(6) DEFAULT NULL COMMENT '- Competencia',
  `mov_obs` VARCHAR(200) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- OBS',
  `mov_inc` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Inclusao',
  `mov_alt` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Alteracao',
  `mov_contrato` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Contrato',
  `tip_ace_codigo` SMALLINT(6) DEFAULT NULL COMMENT '- Tipo de Aceite',
  `mov_documento` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Documento',
  `mov_previsao` SMALLINT(6) DEFAULT NULL COMMENT '- Previsao?\r\n:0 - Nao\r\n:1 - Sim',
  `mov_parcelas` SMALLINT(6) DEFAULT NULL,
  `mov_tipo` SMALLINT(6) DEFAULT NULL COMMENT '- Tipo Movimento:\r\r\n0 - A Pagar\r\r\n1 - A Receber',
  PRIMARY KEY USING BTREE (`mov_codigo`),
   INDEX `cus_codigo` USING BTREE (`cus_codigo`),
   INDEX `neg_codigo` USING BTREE (`neg_codigo`),
   INDEX `cen_codigo` USING BTREE (`cen_codigo`),
   INDEX `uni_codigo` USING BTREE (`uni_codigo`),
   INDEX `pes_codigo` USING BTREE (`pes_codigo`),
   INDEX `con_codigo` USING BTREE (`con_codigo`),
   INDEX `set_codigo` USING BTREE (`set_codigo`),
   INDEX `sit_codigo` USING BTREE (`sit_codigo`),
   INDEX `com_codigo` USING BTREE (`com_codigo`),
   INDEX `tip_ace_codigo` USING BTREE (`tip_ace_codigo`),
  CONSTRAINT `mny_movimento_fk1` FOREIGN KEY (`cus_codigo`) REFERENCES `mny_custo` (`cus_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mny_movimento_fk10` FOREIGN KEY (`tip_ace_codigo`) REFERENCES `mny_tipo_aceite` (`tip_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mny_movimento_fk2` FOREIGN KEY (`neg_codigo`) REFERENCES `mny_centro_negocio` (`neg_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mny_movimento_fk3` FOREIGN KEY (`cen_codigo`) REFERENCES `mny_centro_custo` (`cen_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mny_movimento_fk4` FOREIGN KEY (`uni_codigo`) REFERENCES `mny_unidade` (`uni_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mny_movimento_fk5` FOREIGN KEY (`pes_codigo`) REFERENCES `mny_pessoa` (`pes_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mny_movimento_fk6` FOREIGN KEY (`con_codigo`) REFERENCES `mny_conta` (`con_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mny_movimento_fk7` FOREIGN KEY (`set_codigo`) REFERENCES `mny_setor` (`set_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mny_movimento_fk8` FOREIGN KEY (`sit_codigo`) REFERENCES `sys_situacao` (`sit_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mny_movimento_fk9` FOREIGN KEY (`com_codigo`) REFERENCES `sys_competencia` (`com_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
)ENGINE=InnoDB
AVG_ROW_LENGTH=3276 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB; (`cus_codigo`) REFER `tkce/mny_custo`(`cus_codigo`) ON DE';

DELIMITER $$

CREATE DEFINER = 'root'@'%' TRIGGER `tg_movimento_pessoa` AFTER INSERT ON `mny_movimento`
  FOR EACH ROW
BEGIN
  if (new.pes_codigo is not null) then
    Update mny_pessoa p Set
      p.pes_ult_datamov = CURRENT_TIMESTAMP
    where p.pes_codigo = new.pes_codigo;
  end if;
END$$

DELIMITER ;

#
# Structure for the `mny_movimento_doc` table : 
#

CREATE TABLE `mny_movimento_doc` (
  `mov_codigo` INTEGER(11) NOT NULL COMMENT '- Código do Documento',
  `doc_seq` SMALLINT(6) NOT NULL COMMENT '- Sequencial',
  `doc_path` VARCHAR(200) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Caminho',
  `doc_nome` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Nome do Documento',
  `doc_origem` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Origem',
  PRIMARY KEY USING BTREE (`mov_codigo`, `doc_seq`)
)ENGINE=InnoDB
AVG_ROW_LENGTH=292 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB';

#
# Structure for the `mny_movimento_item` table : 
#

CREATE TABLE `mny_movimento_item` (
  `mov_codigo` INTEGER(11) NOT NULL COMMENT '- Codigo',
  `mov_item` SMALLINT(6) NOT NULL COMMENT '- Item',
  `mov_data_vencto` DATE DEFAULT NULL COMMENT '- Data Vencimento',
  `mov_data_prev` DATE DEFAULT NULL COMMENT '- Data Previsao',
  `mov_valor` DECIMAL(15,2) DEFAULT NULL COMMENT '- Valor',
  `mov_juros` DECIMAL(15,2) DEFAULT NULL COMMENT '- Juros',
  `mov_desconto` DECIMAL(15,2) DEFAULT NULL COMMENT '- Descontos',
  `mov_valor_pagar` DECIMAL(15,2) DEFAULT NULL COMMENT '- Pagar',
  `fpg_codigo` SMALLINT(6) DEFAULT NULL COMMENT '- Forma de Pagamento',
  `tip_doc_codigo` SMALLINT(6) DEFAULT NULL COMMENT '- Tipo de Documento',
  `mov_status` SMALLINT(6) DEFAULT 5 COMMENT '- Status',
  `mov_retencao` DECIMAL(15,2) DEFAULT NULL COMMENT '- Retencao',
  `mov_data_inclusao` DATE DEFAULT NULL COMMENT '- Data Inclusao',
  `mov_parcela` SMALLINT(6) DEFAULT NULL COMMENT '- Parcela',
  `mov_aut_financeiro` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Quem Autorizou',
  `mov_aut_gerencia` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Quem Autorizou',
  PRIMARY KEY USING BTREE (`mov_codigo`, `mov_item`),
   INDEX `mov_codigo` USING BTREE (`mov_codigo`)
)ENGINE=InnoDB
AVG_ROW_LENGTH=16384 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB';

#
# Structure for the `mny_tipo_documento` table : 
#

CREATE TABLE `mny_tipo_documento` (
  `tip_codigo` SMALLINT(6) NOT NULL COMMENT '- Codigo',
  `tip_nome` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Nome',
  `tip_doc_entrada` SMALLINT(6) NOT NULL DEFAULT 0 COMMENT '- Documento de Entrada em Estoque:\r\n0 - Nao\r\n1 - Sim',
  `tip_inc` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Inclusao',
  `tip_alt` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Alteracao',
  PRIMARY KEY USING BTREE (`tip_codigo`)
)ENGINE=InnoDB
AVG_ROW_LENGTH=8192 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB';

#
# Structure for the `mny_tipo_pessoa` table : 
#

CREATE TABLE `mny_tipo_pessoa` (
  `tip_codigo` SMALLINT(6) NOT NULL COMMENT '- Codigo',
  `tip_nome` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Nome',
  `tip_inc` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Inclusao',
  `tip_alt` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Alteracao',
  PRIMARY KEY USING BTREE (`tip_codigo`)
)ENGINE=InnoDB
AVG_ROW_LENGTH=3276 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB';

#
# Structure for the `sys_cfop` table : 
#

CREATE TABLE `sys_cfop` (
  `cfop_codigo` INTEGER(11) NOT NULL COMMENT '- Codigo',
  `cfop_descricao` VARCHAR(250) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Descricao',
  `cfop_especificacao` TEXT COLLATE utf8_general_ci COMMENT '- Especificacao',
  PRIMARY KEY USING BTREE (`cfop_codigo`)
)ENGINE=InnoDB
AVG_ROW_LENGTH=5461 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB';

#
# Structure for the `str_tipo_movimento` table : 
#

CREATE TABLE `str_tipo_movimento` (
  `tmv_codigo` VARCHAR(3) COLLATE utf8_general_ci NOT NULL COMMENT '- Codigo',
  `tmv_grupo` SMALLINT(6) NOT NULL COMMENT '- Grupo:\r\n0 - Nao se aplica\r\n1 - Ajuste de Estoque\r\n2 - Tipos de Entrada',
  `tmv_descricao` VARCHAR(50) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Descricao',
  PRIMARY KEY USING BTREE (`tmv_codigo`)
)ENGINE=InnoDB
AVG_ROW_LENGTH=2730 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB';

#
# Structure for the `str_entrada` table : 
#

CREATE TABLE `str_entrada` (
  `ent_ano` SMALLINT(6) NOT NULL COMMENT '- Ano',
  `ent_codigo` BIGINT(20) NOT NULL COMMENT '- Codigo',
  `ent_tipo` VARCHAR(3) COLLATE utf8_general_ci NOT NULL COMMENT '- Tipo',
  `ent_unidade_neg` SMALLINT(6) NOT NULL COMMENT '- Unidade de Negocio',
  `ent_setor` SMALLINT(6) DEFAULT NULL COMMENT '- Setor',
  `ent_pessoa` INTEGER(11) NOT NULL COMMENT '- Fornecedor',
  `ent_data` DATE DEFAULT NULL COMMENT '- Data',
  `ent_hora` TIME DEFAULT NULL COMMENT '- Hora',
  `ent_doc_tipo` SMALLINT(6) DEFAULT NULL COMMENT '- Tipo Documento',
  `ent_doc_numero` VARCHAR(10) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Numero Documento',
  `ent_doc_serie` VARCHAR(3) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Serie Documento',
  `ent_doc_emissao` DATE DEFAULT NULL COMMENT '- Emissao Documento',
  `ent_competencia` SMALLINT(6) NOT NULL COMMENT '- Competencia',
  `ent_obs` TEXT COLLATE utf8_general_ci COMMENT '- Observacoes',
  `ent_cfop` INTEGER(11) DEFAULT NULL COMMENT '- CFOP',
  `ent_base_icms` DECIMAL(18,4) DEFAULT 0.0000 COMMENT '- Base ICMS',
  `ent_valor_icms` DECIMAL(18,4) DEFAULT 0.0000 COMMENT '- Valor ICMS',
  `ent_base_icms_st` DECIMAL(18,4) DEFAULT 0.0000 COMMENT '- Base ICMS Subs. Tributaria',
  `ent_valor_icms_st` DECIMAL(18,4) DEFAULT 0.0000 COMMENT '- Valor ICMS Subs. Tributaria',
  `ent_valor_total_prod` DECIMAL(18,4) DEFAULT NULL COMMENT '- Valor Total Produto',
  `ent_valor_frete` DECIMAL(18,4) DEFAULT 0.0000 COMMENT '- Valor Frete',
  `ent_valor_seguro` DECIMAL(18,4) DEFAULT 0.0000 COMMENT '- Valor Seguro',
  `ent_valor_desconto` DECIMAL(18,4) DEFAULT 0.0000 COMMENT '- Valor Desconto',
  `ent_valor_outros` DECIMAL(18,4) DEFAULT 0.0000 COMMENT '- Valor Outro',
  `ent_valor_ipi` DECIMAL(18,4) DEFAULT 0.0000 COMMENT '- Valor IPI',
  `ent_valor_nota` DECIMAL(18,4) DEFAULT NULL COMMENT '- Total Nota (Documento)',
  `ent_valor_total_serv` DECIMAL(18,4) DEFAULT NULL COMMENT '- Total Servicos',
  `ent_base_issqn` DECIMAL(18,4) DEFAULT 0.0000 COMMENT '- Base ISSQN',
  `ent_percent_issqn` DECIMAL(15,2) DEFAULT 0.00 COMMENT '- Percentual aliquota ISSQN (ISS)',
  `ent_valor_issqn` DECIMAL(18,4) DEFAULT 0.0000 COMMENT '- Valor ISSQN',
  `ent_status` SMALLINT(6) DEFAULT 0 COMMENT '- Status:\r\n0 - Aberto\r\n1 - Encerrado\r\n2 - Cancelado',
  `ent_usuario_abertura` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Usuario da abertura',
  `ent_usuario_fechamento` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Usuario do encerramento',
  `ent_log_insert` VARCHAR(150) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- LOG de insercao',
  `ent_log_update` VARCHAR(150) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- LOG de atualizacao',
  `ent_log_inactive` VARCHAR(150) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- LOG de inativacao',
  `ent_mov_gerar_cp` SMALLINT(6) DEFAULT 0 COMMENT '- Movimento gera Contas A Pagar:\r\n0 - Nao\r\n1 - Sim',
  `ent_mov_codigo` INTEGER(11) DEFAULT NULL COMMENT '- Movimento Financeiro',
  `ent_aprop_tipo_aceite` SMALLINT(6) DEFAULT NULL COMMENT '- Tipo Aceite',
  `ent_aprop_tipo_custo` SMALLINT(6) DEFAULT NULL COMMENT '- (Apropriacao) Tipo de Custo',
  `ent_aprop_centro_negocio` SMALLINT(6) DEFAULT NULL COMMENT '- (Apropriacao) Centro de Negocios',
  `ent_aprop_unidade_negocio` SMALLINT(6) DEFAULT NULL COMMENT '- (Apropriacao) Unidade de Negocios',
  `ent_aprop_centro_custo` SMALLINT(6) DEFAULT NULL COMMENT '- (Apropriacao) Centro de Custo',
  `ent_aprop_setor` SMALLINT(6) DEFAULT NULL COMMENT '- (Apropriacao) Setor',
  `ent_aprop_conta` SMALLINT(6) DEFAULT NULL COMMENT '- (Apropriacao) Conta',
  PRIMARY KEY USING BTREE (`ent_ano`, `ent_codigo`),
   INDEX `ent_tipo` USING BTREE (`ent_tipo`),
   INDEX `ent_unidade_neg` USING BTREE (`ent_unidade_neg`),
   INDEX `ent_setor` USING BTREE (`ent_setor`),
   INDEX `ent_pessoa` USING BTREE (`ent_pessoa`),
   INDEX `ent_doc_tipo` USING BTREE (`ent_doc_tipo`),
   INDEX `ent_competencia` USING BTREE (`ent_competencia`),
   INDEX `ent_cfop` USING BTREE (`ent_cfop`),
   INDEX `ent_mov_codigo` USING BTREE (`ent_mov_codigo`),
   INDEX `ent_aprop_tipo_custo` USING BTREE (`ent_aprop_tipo_custo`),
   INDEX `ent_aprop_centro_negocio` USING BTREE (`ent_aprop_centro_negocio`),
   INDEX `ent_aprop_unidade_negocio` USING BTREE (`ent_aprop_unidade_negocio`),
   INDEX `ent_aprop_centro_custo` USING BTREE (`ent_aprop_centro_custo`),
   INDEX `ent_aprop_setor` USING BTREE (`ent_aprop_setor`),
   INDEX `ent_aprop_conta` USING BTREE (`ent_aprop_conta`),
   INDEX `ent_aprop_tipo_aceite` USING BTREE (`ent_aprop_tipo_aceite`),
  CONSTRAINT `fk_entrada_aprop_centro_neg` FOREIGN KEY (`ent_aprop_centro_negocio`) REFERENCES `mny_centro_negocio` (`neg_codigo`),
  CONSTRAINT `fk_entrada_aprop_conta` FOREIGN KEY (`ent_aprop_conta`) REFERENCES `mny_conta` (`con_codigo`),
  CONSTRAINT `fk_entrada_aprop_setor` FOREIGN KEY (`ent_aprop_setor`) REFERENCES `mny_setor` (`set_codigo`),
  CONSTRAINT `fk_entrada_aprop_tipo_aceite` FOREIGN KEY (`ent_aprop_tipo_aceite`) REFERENCES `mny_tipo_aceite` (`tip_codigo`),
  CONSTRAINT `fk_entrada_aprop_tipo_custo` FOREIGN KEY (`ent_aprop_tipo_custo`) REFERENCES `mny_custo` (`cus_codigo`),
  CONSTRAINT `fk_entrada_aprop_unidade_neg` FOREIGN KEY (`ent_aprop_unidade_negocio`) REFERENCES `mny_unidade` (`uni_codigo`),
  CONSTRAINT `fk_entrada_centro_custo` FOREIGN KEY (`ent_aprop_centro_custo`) REFERENCES `mny_centro_custo` (`cen_codigo`),
  CONSTRAINT `fk_entrada_cfop` FOREIGN KEY (`ent_cfop`) REFERENCES `sys_cfop` (`cfop_codigo`),
  CONSTRAINT `fk_entrada_cmp` FOREIGN KEY (`ent_competencia`) REFERENCES `sys_competencia` (`com_codigo`),
  CONSTRAINT `fk_entrada_mov_financ` FOREIGN KEY (`ent_mov_codigo`) REFERENCES `mny_movimento` (`mov_codigo`),
  CONSTRAINT `fk_entrada_pes` FOREIGN KEY (`ent_pessoa`) REFERENCES `mny_pessoa` (`pes_codigo`),
  CONSTRAINT `fk_entrada_set` FOREIGN KEY (`ent_setor`) REFERENCES `mny_setor` (`set_codigo`),
  CONSTRAINT `fk_entrada_tipo` FOREIGN KEY (`ent_tipo`) REFERENCES `str_tipo_movimento` (`tmv_codigo`),
  CONSTRAINT `fk_entrada_tpd` FOREIGN KEY (`ent_doc_tipo`) REFERENCES `mny_tipo_documento` (`tip_codigo`),
  CONSTRAINT `fk_entrada_ung` FOREIGN KEY (`ent_unidade_neg`) REFERENCES `mny_unidade` (`uni_codigo`)
)ENGINE=InnoDB
CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB; (`ent_aprop_centro_negocio`) REFER `tkce/mny_centro_negoc';

#
# Structure for the `str_entrada_duplicata` table : 
#

CREATE TABLE `str_entrada_duplicata` (
  `ent_ano` SMALLINT(6) NOT NULL COMMENT '- Ano',
  `ent_codigo` BIGINT(20) NOT NULL COMMENT '- Codigo',
  `dup_sequencia` SMALLINT(6) NOT NULL COMMENT '- Sequencial',
  `dup_numero` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Numero',
  `dup_vencimento` DATE DEFAULT NULL COMMENT '- Data Vencimento',
  `dup_forma_pagto` SMALLINT(6) DEFAULT NULL COMMENT '- Forma de Pagamento',
  `dup_valor` DECIMAL(18,4) DEFAULT NULL COMMENT '- Valor',
  `dup_mov_codigo` INTEGER(11) DEFAULT NULL COMMENT '- Movimento Financeiro',
  `dup_mov_item` SMALLINT(6) DEFAULT NULL COMMENT '- Movimento Financeiro (Parcela)',
  PRIMARY KEY USING BTREE (`ent_codigo`, `ent_ano`, `dup_sequencia`),
   INDEX `ent_ano` USING BTREE (`ent_ano`, `ent_codigo`),
   INDEX `dup_mov_codigo` USING BTREE (`dup_mov_codigo`, `dup_mov_item`),
   INDEX `dup_forma_pagto` USING BTREE (`dup_forma_pagto`),
  CONSTRAINT `fk_entrada_duplicata` FOREIGN KEY (`ent_ano`, `ent_codigo`) REFERENCES `str_entrada` (`ent_ano`, `ent_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_entrada_duplicata_fpg` FOREIGN KEY (`dup_forma_pagto`) REFERENCES `mny_forma_pagto` (`fpg_codigo`),
  CONSTRAINT `fk_entrada_duplicata_mov_financ` FOREIGN KEY (`dup_mov_codigo`, `dup_mov_item`) REFERENCES `mny_movimento_item` (`mov_codigo`, `mov_item`)
)ENGINE=InnoDB
CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB; (`ent_ano` `ent_codigo`) REFER `tkce/str_entrada`(`ent_an';

#
# Structure for the `str_material_apresentacao` table : 
#

CREATE TABLE `str_material_apresentacao` (
  `apr_codigo` INTEGER(11) NOT NULL COMMENT '- Codigo',
  `apr_descricao` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Descricao',
  `apr_ativa` SMALLINT(6) NOT NULL DEFAULT 1 COMMENT '- Apresentacao ativa:\r\n0 - Nao\r\n1 - Sim',
  `apr_log_insert` VARCHAR(150) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Log de insercao',
  `apr_log_update` VARCHAR(150) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Log de atualizacao',
  `apr_log_inactive` VARCHAR(150) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Log de inativacao',
  PRIMARY KEY USING BTREE (`apr_codigo`)
)ENGINE=InnoDB
AVG_ROW_LENGTH=2730 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB';

#
# Structure for the `sys_tributacao_cofins` table : 
#

CREATE TABLE `sys_tributacao_cofins` (
  `trb_codigo` VARCHAR(3) COLLATE utf8_general_ci NOT NULL COMMENT '- Codigo',
  `trb_descricao` VARCHAR(150) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Descricao',
  `trb_indice_acbr` SMALLINT(6) DEFAULT NULL COMMENT '- Indice ACBr',
  PRIMARY KEY USING BTREE (`trb_codigo`)
)ENGINE=InnoDB
AVG_ROW_LENGTH=496 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB';

#
# Structure for the `str_material_descricao` table : 
#

CREATE TABLE `str_material_descricao` (
  `des_codigo` INTEGER(11) NOT NULL COMMENT '- Codigo',
  `des_descricao` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Descricao',
  `des_ativa` SMALLINT(6) DEFAULT 1 COMMENT 'Registro ativo:\r\n0 - Nao\r\n1 - Sim',
  `des_log_insert` VARCHAR(150) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Log de Insercao',
  `des_log_update` VARCHAR(150) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Log de atualizacao',
  `des_log_inactive` VARCHAR(150) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Log de desativacao',
  PRIMARY KEY USING BTREE (`des_codigo`)
)ENGINE=InnoDB
AVG_ROW_LENGTH=2340 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB';

#
# Structure for the `str_material_grupo` table : 
#

CREATE TABLE `str_material_grupo` (
  `grp_codigo` SMALLINT(6) NOT NULL COMMENT '- Codigo',
  `grp_descricao` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Descricao.',
  PRIMARY KEY USING BTREE (`grp_codigo`)
)ENGINE=InnoDB
AVG_ROW_LENGTH=2730 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB';

#
# Structure for the `sys_tributacao_icms` table : 
#

CREATE TABLE `sys_tributacao_icms` (
  `trb_codigo` VARCHAR(3) COLLATE utf8_general_ci NOT NULL COMMENT '- Codigo',
  `trb_descricao` VARCHAR(150) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Descricao',
  `trb_crt` SMALLINT(6) NOT NULL DEFAULT 0 COMMENT '- CRT (Codigo do Regime Tributario):\r\n0 - Normal\r\n1 - Simples Nacional',
  PRIMARY KEY USING BTREE (`trb_codigo`)
)ENGINE=InnoDB
AVG_ROW_LENGTH=780 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB';

#
# Structure for the `sys_tributacao_pis` table : 
#

CREATE TABLE `sys_tributacao_pis` (
  `trb_codigo` VARCHAR(3) COLLATE utf8_general_ci NOT NULL COMMENT '- Codigo.',
  `trb_descricao` VARCHAR(150) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Descricao',
  `trb_indice_acbr` SMALLINT(6) DEFAULT NULL COMMENT '- Indice ACBr',
  PRIMARY KEY USING BTREE (`trb_codigo`)
)ENGINE=InnoDB
AVG_ROW_LENGTH=496 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB';

#
# Structure for the `str_material_subgrupo` table : 
#

CREATE TABLE `str_material_subgrupo` (
  `sgp_codigo` INTEGER(11) NOT NULL COMMENT '- Codigo.',
  `sgp_grupo` SMALLINT(6) DEFAULT NULL COMMENT '- Grupo.',
  `sgp_descricao` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Descricao.',
  PRIMARY KEY USING BTREE (`sgp_codigo`),
   INDEX `sgp_grupo` USING BTREE (`sgp_grupo`),
  CONSTRAINT `fk_str_material_subgrupo_grp` FOREIGN KEY (`sgp_grupo`) REFERENCES `str_material_grupo` (`grp_codigo`) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB
AVG_ROW_LENGTH=2048 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB; (`sgp_grupo`) REFER `tkce/str_material_grupo`(`grp_codigo';

#
# Structure for the `str_material_tipo` table : 
#

CREATE TABLE `str_material_tipo` (
  `tip_codigo` SMALLINT(6) NOT NULL COMMENT '- Codigo',
  `tip_descricao` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Descriçao',
  PRIMARY KEY USING BTREE (`tip_codigo`)
)ENGINE=InnoDB
AVG_ROW_LENGTH=2730 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB';

#
# Structure for the `str_unidade` table : 
#

CREATE TABLE `str_unidade` (
  `und_codigo` INTEGER(11) NOT NULL COMMENT '- Codigo',
  `und_descricao` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Descricao',
  `und_sigla` VARCHAR(10) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Sigla',
  PRIMARY KEY USING BTREE (`und_codigo`)
)ENGINE=InnoDB
AVG_ROW_LENGTH=455 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB';

#
# Structure for the `str_material` table : 
#

CREATE TABLE `str_material` (
  `mat_codigo` BIGINT(20) NOT NULL COMMENT '- Codigo',
  `mat_tipo` SMALLINT(6) NOT NULL COMMENT '- Tipo',
  `mat_descricao` INTEGER(11) DEFAULT NULL COMMENT '- Descricao',
  `mat_apresentacao` INTEGER(11) DEFAULT NULL COMMENT '- Apresentacao',
  `mat_descricao_resumo` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Nome Resumido',
  `mat_especificacao` VARCHAR(250) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Especificacao',
  `mat_referencia` VARCHAR(30) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Referencia',
  `mat_imagem` BLOB COMMENT '- Imagem',
  `mat_status` SMALLINT(6) DEFAULT NULL COMMENT '- Situacao:\r\n0 - Inativo\r\n1 - Ativo\r\n2 - Emprestado',
  `mat_lista` SMALLINT(6) NOT NULL DEFAULT 0 COMMENT '- Lista:\r\n0 - Material/Produto\r\n1 - Servico',
  `mat_grupo` SMALLINT(6) DEFAULT NULL COMMENT '- Grupo',
  `mat_subgrupo` INTEGER(11) DEFAULT NULL COMMENT '- Subgrupo',
  `mat_unidade_compra` INTEGER(11) DEFAULT NULL COMMENT '- Unidade de compra',
  `mat_unidade_consumo` INTEGER(11) DEFAULT NULL COMMENT '- Unidade de consumo',
  `mat_fracionador` DECIMAL(18,4) NOT NULL DEFAULT 1.0000 COMMENT '- Fracionador (Coeficiente de fracionamento)',
  `mat_custo_direto` SMALLINT(6) DEFAULT 0 COMMENT 'Custo direto:\r\n0 - Nao\r\n1 - Sim',
  `mat_custo_indireto` SMALLINT(6) DEFAULT 0 COMMENT 'Custo indireto:\r\n0 - Nao\r\n1 - Sim',
  `mat_aliquota_tipo` SMALLINT(6) DEFAULT 0 COMMENT 'Tipo Aliquota:\r\n0 - ICMS\r\n1 - ISS',
  `mat_aliquota` DECIMAL(15,2) DEFAULT 0.00 COMMENT '- Percentual da aliquota',
  `mat_aliquota_origem` SMALLINT(6) DEFAULT 0 COMMENT '- Aliquota origem:\r\n0 - Nacional\r\n\r\n1 - Estrangeira - Importacao direta\r\n\r\n2 - Estrangeira - Adquirida no mercado interno',
  `mat_tributacao_icms` VARCHAR(3) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Tipo de Tributacao ICMS',
  `mat_tributacao_pis` VARCHAR(3) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Tipo de Tributacao PIS',
  `mat_tributacao_cofins` VARCHAR(3) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Tipo de Tributacao COFINS',
  `mat_cst` VARCHAR(3) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- CST (Codigo da Situacao Tributaria)',
  `mat_csosn` VARCHAR(3) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Codigo da Situacao Tributaria no Simples Nacional',
  `mat_ncm_sh` VARCHAR(15) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Cosigo NCM/SH',
  `mat_aliquota_pis` DECIMAL(15,2) DEFAULT 0.00 COMMENT '- Percentual aliquota PIS',
  `mat_aliquota_cofins` DECIMAL(15,2) DEFAULT 0.00 COMMENT '- Percentual aliquota COFINS',
  `mat_valor_custo_int` DECIMAL(18,4) DEFAULT 0.0000 COMMENT '- Valor de Cuato (Compra - Inteiro)',
  `mat_valor_custo_frc` DECIMAL(18,4) DEFAULT 0.0000 COMMENT '- Valor de Cuato (Consumo - Fracionado)',
  `mat_valor_venda_int` DECIMAL(18,4) DEFAULT 0.0000 COMMENT '- Valor de Venda (Inteiro)',
  `mat_valor_venda_frc` DECIMAL(18,4) DEFAULT 0.0000 COMMENT '- Valor de Venda (Fracionado)',
  `mat_data_cadastro` DATE DEFAULT NULL COMMENT '- Data de cadastro',
  `mat_ultcompra_data` DATE DEFAULT NULL COMMENT '- Data da ultima compra',
  `mat_ultcompra_forn` INTEGER(11) DEFAULT NULL COMMENT '- Fornecedor da ultima compra',
  `mat_ultcompra_valor` DECIMAL(18,4) DEFAULT NULL COMMENT '- Valor da ultima compra (Valor inteiro)',
  `mat_log_insert` VARCHAR(150) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Log de insercao',
  `mat_log_update` VARCHAR(150) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Log de atualizacao',
  `mat_log_inactive` VARCHAR(150) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Log de inativacao',
  PRIMARY KEY USING BTREE (`mat_codigo`),
   INDEX `mat_tipo` USING BTREE (`mat_tipo`),
   INDEX `mat_descricao` USING BTREE (`mat_descricao`),
   INDEX `mat_apresentacao` USING BTREE (`mat_apresentacao`),
   INDEX `mat_grupo` USING BTREE (`mat_grupo`),
   INDEX `mat_subgrupo` USING BTREE (`mat_subgrupo`),
   INDEX `mat_unidade_compra` USING BTREE (`mat_unidade_compra`),
   INDEX `mat_unidade_consumo` USING BTREE (`mat_unidade_consumo`),
   INDEX `mat_ultcompra_forn` USING BTREE (`mat_ultcompra_forn`),
   INDEX `mat_tributacao_icms` USING BTREE (`mat_tributacao_icms`),
   INDEX `mat_tributacao_pis` USING BTREE (`mat_tributacao_pis`),
   INDEX `mat_tributacao_cofins` USING BTREE (`mat_tributacao_cofins`),
  CONSTRAINT `fk_str_material_apr` FOREIGN KEY (`mat_apresentacao`) REFERENCES `str_material_apresentacao` (`apr_codigo`),
  CONSTRAINT `fk_str_material_cofins` FOREIGN KEY (`mat_tributacao_cofins`) REFERENCES `sys_tributacao_cofins` (`trb_codigo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_str_material_des` FOREIGN KEY (`mat_descricao`) REFERENCES `str_material_descricao` (`des_codigo`),
  CONSTRAINT `fk_str_material_grp` FOREIGN KEY (`mat_grupo`) REFERENCES `str_material_grupo` (`grp_codigo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_str_material_icms` FOREIGN KEY (`mat_tributacao_icms`) REFERENCES `sys_tributacao_icms` (`trb_codigo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_str_material_pes` FOREIGN KEY (`mat_ultcompra_forn`) REFERENCES `mny_pessoa` (`pes_codigo`),
  CONSTRAINT `fk_str_material_pis` FOREIGN KEY (`mat_tributacao_pis`) REFERENCES `sys_tributacao_pis` (`trb_codigo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_str_material_sgp` FOREIGN KEY (`mat_subgrupo`) REFERENCES `str_material_subgrupo` (`sgp_codigo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_str_material_tip` FOREIGN KEY (`mat_tipo`) REFERENCES `str_material_tipo` (`tip_codigo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_str_material_ucp` FOREIGN KEY (`mat_unidade_compra`) REFERENCES `str_unidade` (`und_codigo`),
  CONSTRAINT `fk_str_material_ucs` FOREIGN KEY (`mat_unidade_consumo`) REFERENCES `str_unidade` (`und_codigo`)
)ENGINE=InnoDB
AVG_ROW_LENGTH=4096 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB; (`mat_apresentacao`) REFER `tkce/str_material_apresentaca';

DELIMITER $$

CREATE DEFINER = 'root'@'%' TRIGGER `tg_material_historico_insert` AFTER INSERT ON `str_material`
  FOR EACH ROW
BEGIN
  Insert Into str_material_historico (
      his_codigo
    , his_material
    , his_data
    , his_hora
    , his_unidade_consumo
    , his_discriminacao
    , his_log_insert
  ) values (
      UUID()
    , new.mat_codigo
    , current_date
    , current_time
    , new.mat_unidade_consumo
    , 'Cadastro do material/produto'
    , new.mat_log_insert
  );
END$$

CREATE DEFINER = 'root'@'%' TRIGGER `tg_material_historico_status` AFTER UPDATE ON `str_material`
  FOR EACH ROW
BEGIN
  if ((old.mat_status <> new.mat_status) and (new.mat_status <> 1)) then
  
    Insert Into str_material_historico (
        his_codigo
      , his_material
      , his_data
      , his_hora
      , his_unidade_consumo
      , his_discriminacao
      , his_log_insert
    ) values (
        UUID()
      , new.mat_codigo
      , current_date
      , current_time
      , new.mat_unidade_consumo
      , 'Material/produto desativado ou emprestado'
      , new.mat_log_inactive
    );
  
  elseif ((old.mat_status <> new.mat_status) and (new.mat_status = 1)) then
  
    Insert Into str_material_historico (
        his_codigo
      , his_material
      , his_data
      , his_hora
      , his_unidade_consumo
      , his_discriminacao
      , his_log_insert
    ) values (
        UUID()
      , new.mat_codigo
      , current_date
      , current_time
      , new.mat_unidade_consumo
      , 'Material/produto reativado'
      , new.mat_log_update
    );
  
  end if;
END$$

DELIMITER ;

#
# Structure for the `str_entrada_item` table : 
#

CREATE TABLE `str_entrada_item` (
  `ent_ano` SMALLINT(6) NOT NULL COMMENT '- Ano',
  `ent_codigo` BIGINT(20) NOT NULL COMMENT '- Codigo',
  `itm_sequencia` SMALLINT(6) NOT NULL COMMENT '- Sequencial',
  `itm_material` BIGINT(20) NOT NULL COMMENT '- Material/Servico',
  `itm_ncm_sh` VARCHAR(10) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- NCM/SH',
  `itm_cst` VARCHAR(3) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- CST (Codigo da Situacao Tributaria)',
  `itm_csosn` VARCHAR(3) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- CSOSN',
  `itm_cfop` INTEGER(11) DEFAULT NULL COMMENT '- CFOP',
  `itm_unidade_compra` INTEGER(11) DEFAULT NULL COMMENT '- Unidade de Compra',
  `itm_quantidade` DECIMAL(18,4) DEFAULT NULL COMMENT '- Quantidade',
  `itm_fracionador` DECIMAL(18,4) DEFAULT 1.0000 COMMENT '- Fracionador',
  `itm_valor_unitario` DECIMAL(18,4) DEFAULT NULL COMMENT '- Valor Unitario',
  `itm_valor_total` DECIMAL(18,4) DEFAULT NULL COMMENT '- Valor Total (Quantidade x Valor Unitario)',
  `itm_valor_ipi` DECIMAL(18,4) DEFAULT 0.0000 COMMENT '- Valor IPI',
  `itm_percent_participa` DECIMAL(18,4) DEFAULT 0.0000 COMMENT '- Percentual de Participacao (Total / Total Produto Nota x 100)',
  `itm_valor_frete` DECIMAL(18,4) DEFAULT 0.0000 COMMENT '- Valor Frete (Proporcional)',
  `itm_valor_desconto` DECIMAL(18,4) DEFAULT 0.0000 COMMENT '- Valor Desconto (Proporcional)',
  `itm_valor_seguro` DECIMAL(18,4) DEFAULT 0.0000 COMMENT '- Valor Seguro (Proporcional)',
  `itm_valor_outros` DECIMAL(18,4) DEFAULT 0.0000 COMMENT '- Valor Outros (Proporcional)',
  `itm_valor_custo` DECIMAL(18,4) DEFAULT NULL COMMENT '- Valor Custo Final ([Total + Frete + Seguro + Outros - Desconto]/Quantidade)',
  PRIMARY KEY USING BTREE (`ent_codigo`, `ent_ano`, `itm_sequencia`),
   INDEX `ent_codigo` USING BTREE (`ent_codigo`, `ent_ano`),
   INDEX `ent_ano` USING BTREE (`ent_ano`, `ent_codigo`),
   INDEX `itm_material` USING BTREE (`itm_material`),
   INDEX `itm_cfop` USING BTREE (`itm_cfop`),
   INDEX `itm_unidade_compra` USING BTREE (`itm_unidade_compra`),
  CONSTRAINT `fk_entrada_item` FOREIGN KEY (`ent_ano`, `ent_codigo`) REFERENCES `str_entrada` (`ent_ano`, `ent_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_entrada_item_cfop` FOREIGN KEY (`itm_cfop`) REFERENCES `sys_cfop` (`cfop_codigo`),
  CONSTRAINT `fk_entrada_item_mat` FOREIGN KEY (`itm_material`) REFERENCES `str_material` (`mat_codigo`),
  CONSTRAINT `fk_entrada_item_unc` FOREIGN KEY (`itm_unidade_compra`) REFERENCES `str_unidade` (`und_codigo`)
)ENGINE=InnoDB
CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB; (`ent_ano` `ent_codigo`) REFER `tkce/str_entrada`(`ent_an';

#
# Structure for the `str_estoque_ajuste` table : 
#

CREATE TABLE `str_estoque_ajuste` (
  `eaj_ano` SMALLINT(6) NOT NULL COMMENT '- Ano',
  `eaj_codigo` INTEGER(11) NOT NULL COMMENT '- Controle',
  `eaj_unidade_neg` SMALLINT(6) NOT NULL COMMENT '- Unidade de Negocio',
  `eaj_data` DATE DEFAULT NULL COMMENT '- Data',
  `eaj_hora` TIME DEFAULT NULL COMMENT '- Hora',
  `eaj_competencia` SMALLINT(6) DEFAULT NULL COMMENT '- Competencia',
  `eaj_tipo` VARCHAR(3) COLLATE utf8_general_ci NOT NULL COMMENT '- Tipo do movimento',
  `eaj_obs` VARCHAR(250) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Observacoes',
  `eaj_status` SMALLINT(6) DEFAULT 0 COMMENT '- Status:\r\n0 - Aberto\r\n1 - Encerrado\r\n2 - Cancelado',
  `eaj_usuario_abertura` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Usuario de abertura',
  `eaj_usuario_fechamento` VARCHAR(100) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Usuario de fechamento',
  `eaj_log_insert` VARCHAR(150) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- LOG de Insecao',
  `eaj_log_update` VARCHAR(150) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- LOG de Alteracao',
  `eaj_log_inactive` VARCHAR(150) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- LOG de Inativacao (Cancelamento)',
  PRIMARY KEY USING BTREE (`eaj_ano`, `eaj_codigo`),
   INDEX `eaj_unidade_neg` USING BTREE (`eaj_unidade_neg`),
   INDEX `eaj_tipo` USING BTREE (`eaj_tipo`),
   INDEX `eaj_competencia` USING BTREE (`eaj_competencia`),
  CONSTRAINT `fk_estoque_ajuste_cmp` FOREIGN KEY (`eaj_competencia`) REFERENCES `sys_competencia` (`com_codigo`),
  CONSTRAINT `fk_estoque_ajuste_tmv` FOREIGN KEY (`eaj_tipo`) REFERENCES `str_tipo_movimento` (`tmv_codigo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_estoque_ajuste_ung` FOREIGN KEY (`eaj_unidade_neg`) REFERENCES `mny_unidade` (`uni_codigo`)
)ENGINE=InnoDB
AVG_ROW_LENGTH=16384 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB; (`eaj_competencia`) REFER `tkce/sys_competencia`(`com_cod';

DELIMITER $$

CREATE DEFINER = 'root'@'%' TRIGGER `tg_estoque_ajuste_encerrar` AFTER UPDATE ON `str_estoque_ajuste`
  FOR EACH ROW
BEGIN
  Declare vMovimento Bigint;
  Declare vSequencial Smallint;
  Declare vMaterial Integer;
  Declare vFracionador Decimal(18,4);
  Declare vQuantidade Decimal(18,4);
  Declare vEstoque Decimal(18,4);
  Declare vUnidadeCns Smallint;
  Declare flag Int Default 0;
  
  -- Listar os itens do Ajuste de Estoque
  Declare tCursor Cursor For
    Select
        i.itm_sequencia
      , i.itm_material
      , i.itm_fracionador
      , i.itm_qtde_nova
      , i.itm_unidade_consumo
      , coalesce(sum(e.met_quantidade), 0)
    from str_estoque_ajuste_item i
      left join str_material_estoque e on (e.met_unidade_neg = new.eaj_unidade_neg and e.met_material = i.itm_material)
    where i.eaj_ano    = new.eaj_ano
      and i.eaj_codigo = new.eaj_codigo
    group by
        i.itm_sequencia
      , i.itm_material
      , i.itm_fracionador
      , i.itm_qtde_nova
      , i.itm_unidade_consumo;
  
  Declare Continue Handler For Not Found Set flag = 1;
  
  -- Movimento Encerrado
  if ((old.eaj_status <> new.eaj_status) and (new.eaj_status = 1)) then
    Open tCursor;

    Repeat
      Fetch tCursor Into
          vSequencial
        , vMaterial
        , vFracionador
        , vQuantidade
        , vUnidadeCns
        , vEstoque;
        
      -- Buscar registro de estoque  
      Set vMovimento = coalesce((
        Select 
          max(met_codigo) 
        from str_material_estoque x
        where x.met_unidade_neg = new.eaj_unidade_neg
          and x.met_material    = vMaterial), 0);
          
      if (vMovimento = 0) then 
        Set vMovimento = (Select max(met_codigo) from str_material_estoque);
        Set vMovimento = coalesce(vMovimento, 0) + 1;
        
        -- Inserir registro de estoque
        Insert Into str_material_estoque (
            met_codigo
          , met_unidade_neg
          , met_material
          , met_fracionador
          , met_quantidade
        ) values (
            vMovimento
          , new.eaj_unidade_neg
          , vMaterial
          , vFracionador
          , vQuantidade
        );
      else
        -- Atualizar registro de estoque
        Update str_material_estoque x Set
          x.met_quantidade = vQuantidade
        where x.met_codigo = vMovimento;
      end if;     
      
      -- Gravar historico de estoque
      Update str_estoque_ajuste_item i Set
        i.itm_qtde_antiga = vEstoque
      where i.eaj_ano    = new.eaj_ano
        and i.eaj_codigo = new.eaj_codigo
        and i.itm_sequencia = vSequencial;
          
      -- Gerar registro de historico  
      Insert Into str_material_historico (
          his_codigo
        , his_material
        , his_data
        , his_hora
        , his_quantidade_old
        , his_quantidade_new
        , his_unidade_consumo
        , his_discriminacao
        , his_log_insert
      ) values (
          UUID()
        , vMaterial
        , current_date
        , current_time
        , vEstoque
        , vQuantidade
        , vUnidadeCns
        , 'Ajuste de estoque'
        , new.eaj_log_update
      );

    Until flag
    End Repeat;
    
    Close tCursor;
    
  end if; 
  
END$$

DELIMITER ;

#
# Structure for the `str_estoque_ajuste_item` table : 
#

CREATE TABLE `str_estoque_ajuste_item` (
  `eaj_ano` SMALLINT(5) NOT NULL COMMENT '- Ano',
  `eaj_codigo` INTEGER(10) NOT NULL COMMENT '- Codigo',
  `itm_sequencia` SMALLINT(5) NOT NULL COMMENT '- Sequencial',
  `itm_material` BIGINT(20) NOT NULL COMMENT '- Material',
  `itm_qtde_nova` DECIMAL(18,4) DEFAULT NULL COMMENT '- Nova quantidade',
  `itm_qtde_antiga` DECIMAL(18,4) DEFAULT NULL COMMENT '- Quantidade antiga',
  `itm_unidade_consumo` INTEGER(11) NOT NULL COMMENT '- Unidade de consumo',
  `itm_fracionador` DECIMAL(18,4) NOT NULL DEFAULT 1.0000 COMMENT '- Fracionador',
  PRIMARY KEY USING BTREE (`eaj_ano`, `eaj_codigo`, `itm_sequencia`),
   INDEX `eaj_ano` USING BTREE (`eaj_ano`, `eaj_codigo`),
   INDEX `itm_material` USING BTREE (`itm_material`),
  CONSTRAINT `fk_estoque_ajuste_item_a` FOREIGN KEY (`eaj_ano`, `eaj_codigo`) REFERENCES `str_estoque_ajuste` (`eaj_ano`, `eaj_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_estoque_ajuste_item_m` FOREIGN KEY (`itm_material`) REFERENCES `str_material` (`mat_codigo`)
)ENGINE=InnoDB
AVG_ROW_LENGTH=8192 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB; (`eaj_ano` `eaj_codigo`) REFER `tkce/str_estoque_ajuste`(';

#
# Structure for the `str_material_estoque` table : 
#

CREATE TABLE `str_material_estoque` (
  `met_codigo` BIGINT(20) NOT NULL COMMENT '- Codigo',
  `met_unidade_neg` SMALLINT(6) NOT NULL COMMENT '- Unidade de Negocio',
  `met_material` BIGINT(20) NOT NULL COMMENT '- Material/Produto',
  `met_fracionador` DECIMAL(18,4) NOT NULL DEFAULT 1.0000 COMMENT '- Fracionador (Coeficiente)',
  `met_quantidade` DECIMAL(18,4) NOT NULL DEFAULT 0.0000 COMMENT '- Quantidade',
  PRIMARY KEY USING BTREE (`met_codigo`),
   INDEX `met_unidade_neg` USING BTREE (`met_unidade_neg`),
   INDEX `met_material` USING BTREE (`met_material`),
  CONSTRAINT `fk_material_estoque_mat` FOREIGN KEY (`met_material`) REFERENCES `str_material` (`mat_codigo`),
  CONSTRAINT `fk_material_estoque_ung` FOREIGN KEY (`met_unidade_neg`) REFERENCES `mny_unidade` (`uni_codigo`)
)ENGINE=InnoDB
AVG_ROW_LENGTH=8192 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB; (`met_material`) REFER `tkce/str_material`(`mat_codigo`);';

#
# Structure for the `str_material_historico` table : 
#

CREATE TABLE `str_material_historico` (
  `his_codigo` VARCHAR(38) COLLATE utf8_general_ci NOT NULL COMMENT '- Codigo (GUID)',
  `his_unidade_neg` SMALLINT(6) DEFAULT NULL COMMENT '- Unidade de Negocio',
  `his_material` BIGINT(20) NOT NULL COMMENT '- Material/Produto',
  `his_data` DATE DEFAULT NULL COMMENT '- Data',
  `his_hora` TIME DEFAULT NULL COMMENT '- Hora',
  `his_quantidade_old` DECIMAL(18,4) DEFAULT NULL COMMENT '- Estoque anterior',
  `his_quantidade_new` DECIMAL(18,4) DEFAULT NULL COMMENT '- Estoque novo',
  `his_unidade_consumo` INTEGER(11) NOT NULL COMMENT '- Unidade de medida (Consumo)',
  `his_discriminacao` VARCHAR(250) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Discriminacao do processo gerador do historico',
  `his_log_insert` VARCHAR(150) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Log de insercao',
  PRIMARY KEY USING BTREE (`his_codigo`),
   INDEX `his_unidade_neg` USING BTREE (`his_unidade_neg`),
   INDEX `his_material` USING BTREE (`his_material`),
   INDEX `his_unidade_consumo` USING BTREE (`his_unidade_consumo`),
  CONSTRAINT `fk_material_historico_mat` FOREIGN KEY (`his_material`) REFERENCES `str_material` (`mat_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_material_historico_ung` FOREIGN KEY (`his_unidade_neg`) REFERENCES `mny_unidade` (`uni_codigo`),
  CONSTRAINT `fk_material_historico_uns` FOREIGN KEY (`his_unidade_consumo`) REFERENCES `str_unidade` (`und_codigo`)
)ENGINE=InnoDB
AVG_ROW_LENGTH=2340 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB; (`his_material`) REFER `tkce/str_material`(`mat_codigo`) ';

DELIMITER $$

CREATE DEFINER = 'root'@'%' TRIGGER `tg_material_historico_guid` BEFORE INSERT ON `str_material_historico`
  FOR EACH ROW
BEGIN
  declare new_guid varchar(38);
  if ( new.his_codigo is null ) then
    Select 
      UUID()
    Into  
  	  new_guid;
      
    Set new.his_codigo = new_guid;
  end if;
END$$

DELIMITER ;

#
# Structure for the `str_material_setor` table : 
#

CREATE TABLE `str_material_setor` (
  `mat_codigo` BIGINT(20) NOT NULL COMMENT '- Material',
  `mat_setor` SMALLINT(6) NOT NULL COMMENT '- Setor',
  `mat_setor_requisita` SMALLINT(6) DEFAULT 1 COMMENT '- Setor requisita material:\r\n0 - Nao\r\n1 - Sim',
  PRIMARY KEY USING BTREE (`mat_codigo`, `mat_setor`),
   INDEX `mat_codigo` USING BTREE (`mat_codigo`),
   INDEX `set_codigo` USING BTREE (`mat_setor`),
  CONSTRAINT `fk_str_material_setor_mat` FOREIGN KEY (`mat_codigo`) REFERENCES `str_material` (`mat_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_str_material_setor_set` FOREIGN KEY (`mat_setor`) REFERENCES `mny_setor` (`set_codigo`) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB
AVG_ROW_LENGTH=372 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB; (`mat_codigo`) REFER `tkce/str_material`(`mat_codigo`) ON';

#
# Structure for the `sys_empresa` table : 
#

CREATE TABLE `sys_empresa` (
  `emp_codigo` SMALLINT(6) NOT NULL,
  `emp_razao_social` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL,
  `emp_fantasia` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL,
  `emp_cnpj` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  `emp_imagem` BLOB,
  `emp_end_logra` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL,
  `emp_end_bairro` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL,
  `emp_end_cidade` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL,
  `emp_end_cep` VARCHAR(8) COLLATE utf8_general_ci DEFAULT NULL,
  `emp_end_uf` VARCHAR(2) COLLATE utf8_general_ci DEFAULT NULL,
  `emp_end_fone` VARCHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  `emp_site` VARCHAR(200) COLLATE utf8_general_ci DEFAULT NULL,
  `emp_ftp` VARCHAR(200) COLLATE utf8_general_ci DEFAULT NULL,
  `emp_email` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL,
  `emp_inc` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL,
  `emp_alt` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL,
  `emp_custos` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL,
  `emp_financeiro` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL,
  `emp_diretor` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL,
  `emp_aceite` SMALLINT(6) DEFAULT NULL,
  PRIMARY KEY USING BTREE (`emp_codigo`)
)ENGINE=InnoDB
AVG_ROW_LENGTH=16384 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB';

#
# Structure for the `sys_objeto` table : 
#

CREATE TABLE `sys_objeto` (
  `obj_codigo` SMALLINT(6) NOT NULL COMMENT '- Codigo',
  `obj_nome` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Nome',
  `obj_tipo` SMALLINT(1) DEFAULT NULL COMMENT '- Tipo\r\n0: Formulario\r\n1: Processo\r\n2: Relatorio',
  `obj_inc` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Inclusao',
  `obj_alt` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Alteraçao',
  PRIMARY KEY USING BTREE (`obj_codigo`)
)ENGINE=InnoDB
AVG_ROW_LENGTH=5461 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB';

#
# Structure for the `sys_usuario` table : 
#

CREATE TABLE `sys_usuario` (
  `usr_codigo` SMALLINT(6) NOT NULL COMMENT '- Codigo do Usuario',
  `usr_nome` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Nome de Usuario',
  `usr_senha` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Senha',
  `usr_nivel` SMALLINT(6) DEFAULT NULL COMMENT '- Nivel\r\n0: Usuario\r\n1: Supervidor\r\n2: Administrador',
  `usr_status` SMALLINT(6) DEFAULT 1 COMMENT '- Status:\r\n0 - Inativo\r\n1 - Ativo',
  `usr_inc` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Inclusao',
  `usr_alt` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`usr_codigo`)
)ENGINE=InnoDB
AVG_ROW_LENGTH=5461 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB';

#
# Structure for the `sys_permissao` table : 
#

CREATE TABLE `sys_permissao` (
  `usr_codigo` SMALLINT(6) NOT NULL COMMENT '- Codigo Usuario',
  `obj_codigo` SMALLINT(6) NOT NULL COMMENT '- Codigo Objeto',
  `per_nivel` SMALLINT(6) DEFAULT NULL COMMENT '- Nivel:\r\n0: Usuario\r\n1: Gerente\r\n2: Administrador',
  `per_inc` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Inclusao',
  `per_alt` VARCHAR(60) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Alteracao',
  PRIMARY KEY USING BTREE (`usr_codigo`, `obj_codigo`),
   INDEX `usr_codigo` USING BTREE (`usr_codigo`),
   INDEX `obj_codigo` USING BTREE (`obj_codigo`),
  CONSTRAINT `sys_permissao_fk1` FOREIGN KEY (`usr_codigo`) REFERENCES `sys_usuario` (`usr_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sys_permissao_fk2` FOREIGN KEY (`obj_codigo`) REFERENCES `sys_objeto` (`obj_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
)ENGINE=InnoDB
AVG_ROW_LENGTH=8192 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB; (`usr_codigo`) REFER `tkce/sys_usuario`(`usr_codigo`) ON ';

#
# Structure for the `sys_sistema` table : 
#

CREATE TABLE `sys_sistema` (
  `sis_codigo` SMALLINT(6) NOT NULL COMMENT '- Codigo',
  `sis_descricao` VARCHAR(150) COLLATE utf8_general_ci DEFAULT NULL COMMENT '- Descriçao',
  PRIMARY KEY USING BTREE (`sis_codigo`)
)ENGINE=InnoDB
AVG_ROW_LENGTH=16384 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB';

#
# Structure for the `sys_sistema_objeto` table : 
#

CREATE TABLE `sys_sistema_objeto` (
  `sis_codigo` SMALLINT(6) NOT NULL COMMENT '- Sistema',
  `obj_codigo` SMALLINT(6) NOT NULL COMMENT '- Objeto',
  PRIMARY KEY USING BTREE (`sis_codigo`, `obj_codigo`),
   INDEX `sis_codigo` USING BTREE (`sis_codigo`),
   INDEX `obj_codigo` USING BTREE (`obj_codigo`),
  CONSTRAINT `fk_sys_sistema_objeto_obj` FOREIGN KEY (`obj_codigo`) REFERENCES `sys_objeto` (`obj_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sys_sistema_objeto_sis` FOREIGN KEY (`sis_codigo`) REFERENCES `sys_sistema` (`sis_codigo`) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB
AVG_ROW_LENGTH=16384 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
COMMENT='InnoDB free: 11264 kB; (`obj_codigo`) REFER `tkce/sys_objeto`(`obj_codigo`) ON U';

#
# Definition for the `vw_cidade_estado` view : 
#

CREATE ALGORITHM=UNDEFINED DEFINER='root'@'%' SQL SECURITY DEFINER VIEW `vw_cidade_estado`
AS
select 
    `c`.`cid_codigo` AS `cid_codigo`,
    `c`.`cid_nome` AS `cid_nome`,
    `c`.`cid_cep_inicial` AS `cid_cep_inicial`,
    `c`.`cid_cep_final` AS `cid_cep_final`,
    `c`.`cid_ddd` AS `cid_ddd`,
    `e`.`est_codigo` AS `est_codigo`,
    `e`.`est_nome` AS `est_nome`,
    `e`.`est_sigla` AS `est_sigla` 
  from 
    (`sys_cidade` `c` join `sys_estado` `e` on((`e`.`est_codigo` = `c`.`cid_estado`))) 
  order by 
    `e`.`est_sigla`,`c`.`cid_nome`;

#
# Definition for the `vw_conta_corrente` view : 
#

CREATE ALGORITHM=UNDEFINED DEFINER='root'@'%' SQL SECURITY DEFINER VIEW `vw_conta_corrente`
AS
select 
    `cc`.`ccr_codigo` AS `ccr_codigo`,
    `cc`.`ban_codigo` AS `ban_codigo`,
    `bb`.`bco_nome` AS `bco_nome`,
    `bb`.`bco_sigla` AS `bco_sigla`,
    `cc`.`ccr_agencia` AS `ccr_agencia`,
    `cc`.`ccr_agencia_dv` AS `ccr_agencia_dv`,
    `cc`.`ccr_conta` AS `ccr_conta`,
    `cc`.`ccr_conta_dv` AS `ccr_conta_dv`,
    concat(coalesce(`bb`.`bco_sigla`,`bb`.`bco_nome`),_utf8' AG. ',`cc`.`ccr_agencia`,(case when (trim(`cc`.`ccr_agencia_dv`) = _utf8'') then _utf8'' else _utf8'-' end),`cc`.`ccr_agencia_dv`,_utf8' C/C. ',`cc`.`ccr_conta`,(case when (trim(`cc`.`ccr_conta_dv`) = _utf8'') then _utf8'' else _utf8'-' end),`cc`.`ccr_conta_dv`) AS `banco_conta` 
  from 
    (`mny_conta_corrente` `cc` left join `sys_banco` `bb` on((`bb`.`bco_codigo` = `cc`.`ban_codigo`))) 
  order by 
    9;

#
# Definition for the `vw_info` view : 
#

CREATE ALGORITHM=UNDEFINED DEFINER='root'@'%' SQL SECURITY DEFINER VIEW `vw_info`
AS
select 
    uuid() AS `Guid`,
    curdate() AS `Data`,
    curtime() AS `Hora`,
    now() AS `DataHora`,
    current_user() AS `Usuario`;



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;