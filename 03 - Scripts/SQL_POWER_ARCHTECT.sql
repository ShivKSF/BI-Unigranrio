
CREATE TABLE public.dim_motoboy (
                sk_motoboy INTEGER NOT NULL,
                nk_motoboy INTEGER NOT NULL,
                nm_motoboy VARCHAR(50) NOT NULL,
                elt_dt_inicio TIMESTAMP NOT NULL,
                elt_dt_fim TIMESTAMP NOT NULL,
                versao INTEGER NOT NULL,
                CONSTRAINT sk_motoboy PRIMARY KEY (sk_motoboy)
);


CREATE SEQUENCE public.dim_cliente_sk_cliente_seq;

CREATE TABLE public.dim_cliente (
                sk_cliente INTEGER NOT NULL DEFAULT nextval('public.dim_cliente_sk_cliente_seq'),
                nk_cliente INTEGER NOT NULL,
                nm_cliente VARCHAR(50) NOT NULL,
                bairro VARCHAR(50) NOT NULL,
                cidade VARCHAR(50) NOT NULL,
                etl_dt_inicio TIMESTAMP NOT NULL,
                etl_dt_fim TIMESTAMP NOT NULL,
                versao INTEGER NOT NULL,
                CONSTRAINT sk_cliente PRIMARY KEY (sk_cliente)
);


ALTER SEQUENCE public.dim_cliente_sk_cliente_seq OWNED BY public.dim_cliente.sk_cliente;

CREATE SEQUENCE public.dim_data_sk_data_seq;

CREATE TABLE public.dim_data (
                sk_data INTEGER NOT NULL DEFAULT nextval('public.dim_data_sk_data_seq'),
                nk_data DATE NOT NULL,
                desc_data_completa VARCHAR(60) NOT NULL,
                nr_ano INTEGER NOT NULL,
                nm_trimestre VARCHAR(20) NOT NULL,
                nr_mes INTEGER NOT NULL,
                nm_mes VARCHAR(20) NOT NULL,
                ano_mes VARCHAR(20) NOT NULL,
                nr_semana INTEGER NOT NULL,
                ano_semana VARCHAR(20) NOT NULL,
                nr_dia INTEGER NOT NULL,
                nr_dia_ano INTEGER NOT NULL,
                nm_dia_semana VARCHAR(20) NOT NULL,
                flag_final_semana CHAR(3) NOT NULL,
                flag_feriado CHAR(3) NOT NULL,
                nm_feriado VARCHAR(60) NOT NULL,
                elt_dt_inicio TIMESTAMP NOT NULL,
                elt_dt_fim VARCHAR NOT NULL,
                versao INTEGER NOT NULL,
                CONSTRAINT sk_data PRIMARY KEY (sk_data)
);


ALTER SEQUENCE public.dim_data_sk_data_seq OWNED BY public.dim_data.sk_data;

CREATE SEQUENCE public.dim_produto_sk_produto_seq;

CREATE TABLE public.dim_produto (
                sk_produto INTEGER NOT NULL DEFAULT nextval('public.dim_produto_sk_produto_seq'),
                nk_produto INTEGER NOT NULL,
                nm_produto VARCHAR(50) NOT NULL,
                preco REAL NOT NULL,
                etl_dt_inicio TIMESTAMP NOT NULL,
                etl_dt_fim TIMESTAMP NOT NULL,
                versao INTEGER NOT NULL,
                CONSTRAINT sk_produto PRIMARY KEY (sk_produto)
);


ALTER SEQUENCE public.dim_produto_sk_produto_seq OWNED BY public.dim_produto.sk_produto;

CREATE TABLE public.ft_entrega (
                sk_cliente INTEGER NOT NULL,
                sk_motoboy INTEGER NOT NULL,
                sk_produto INTEGER NOT NULL,
                sk_data INTEGER NOT NULL,
                duracao TIME NOT NULL,
                hora_inicio TIME NOT NULL,
                hora_fim TIME NOT NULL,
                valor_total REAL NOT NULL
);


ALTER TABLE public.ft_entrega ADD CONSTRAINT dim_motoboy_ft_entrega_fk
FOREIGN KEY (sk_motoboy)
REFERENCES public.dim_motoboy (sk_motoboy)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ft_entrega ADD CONSTRAINT dim_cliente_ft_venda_fk
FOREIGN KEY (sk_cliente)
REFERENCES public.dim_cliente (sk_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ft_entrega ADD CONSTRAINT dim_tempo_ft_venda_fk
FOREIGN KEY (sk_data)
REFERENCES public.dim_data (sk_data)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ft_entrega ADD CONSTRAINT dim_pizza_ft_venda_fk
FOREIGN KEY (sk_produto)
REFERENCES public.dim_produto (sk_produto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
