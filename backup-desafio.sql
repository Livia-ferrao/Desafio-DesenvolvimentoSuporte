PGDMP         *                {            Teste4 #   14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)     15.2 (Ubuntu 15.2-1.pgdg22.04+1) 0    J           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            K           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            L           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            M           1262    33397    Teste4    DATABASE     t   CREATE DATABASE "Teste4" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'pt_BR.UTF-8';
    DROP DATABASE "Teste4";
                postgres    false                        2615    33398    pedidos    SCHEMA        CREATE SCHEMA pedidos;
    DROP SCHEMA pedidos;
                postgres    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false            N           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    4            �            1259    33400 
   categorias    TABLE     g   CREATE TABLE pedidos.categorias (
    id integer NOT NULL,
    nome character varying(100) NOT NULL
);
    DROP TABLE pedidos.categorias;
       pedidos         heap    postgres    false    6            �            1259    33399    categorias_id_seq    SEQUENCE     �   CREATE SEQUENCE pedidos.categorias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE pedidos.categorias_id_seq;
       pedidos          postgres    false    6    211            O           0    0    categorias_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE pedidos.categorias_id_seq OWNED BY pedidos.categorias.id;
          pedidos          postgres    false    210            �            1259    33421    clientes    TABLE     �   CREATE TABLE pedidos.clientes (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    email character varying(100) NOT NULL
);
    DROP TABLE pedidos.clientes;
       pedidos         heap    postgres    false    6            �            1259    33420    clientes_id_seq    SEQUENCE     �   CREATE SEQUENCE pedidos.clientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE pedidos.clientes_id_seq;
       pedidos          postgres    false    215    6            P           0    0    clientes_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE pedidos.clientes_id_seq OWNED BY pedidos.clientes.id;
          pedidos          postgres    false    214            �            1259    33442    itens_pedido    TABLE     �   CREATE TABLE pedidos.itens_pedido (
    id integer NOT NULL,
    quantidade integer NOT NULL,
    preco numeric(10,2) NOT NULL,
    pedido_id integer,
    produto_id integer
);
 !   DROP TABLE pedidos.itens_pedido;
       pedidos         heap    postgres    false    6            �            1259    33441    itens_pedido_id_seq    SEQUENCE     �   CREATE SEQUENCE pedidos.itens_pedido_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE pedidos.itens_pedido_id_seq;
       pedidos          postgres    false    6    219            Q           0    0    itens_pedido_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE pedidos.itens_pedido_id_seq OWNED BY pedidos.itens_pedido.id;
          pedidos          postgres    false    218            �            1259    33428    pedidos    TABLE     �   CREATE TABLE pedidos.pedidos (
    id integer NOT NULL,
    data date NOT NULL,
    endereco_entrega text NOT NULL,
    cliente_id integer
);
    DROP TABLE pedidos.pedidos;
       pedidos         heap    postgres    false    6            �            1259    33427    pedidos_id_seq    SEQUENCE     �   CREATE SEQUENCE pedidos.pedidos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE pedidos.pedidos_id_seq;
       pedidos          postgres    false    6    217            R           0    0    pedidos_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE pedidos.pedidos_id_seq OWNED BY pedidos.pedidos.id;
          pedidos          postgres    false    216            �            1259    33407    produtos    TABLE     �   CREATE TABLE pedidos.produtos (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    descricao text NOT NULL,
    preco numeric(10,2) NOT NULL,
    categoria_id integer
);
    DROP TABLE pedidos.produtos;
       pedidos         heap    postgres    false    6            �            1259    33406    produtos_id_seq    SEQUENCE     �   CREATE SEQUENCE pedidos.produtos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE pedidos.produtos_id_seq;
       pedidos          postgres    false    6    213            S           0    0    produtos_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE pedidos.produtos_id_seq OWNED BY pedidos.produtos.id;
          pedidos          postgres    false    212            �           2604    33403    categorias id    DEFAULT     p   ALTER TABLE ONLY pedidos.categorias ALTER COLUMN id SET DEFAULT nextval('pedidos.categorias_id_seq'::regclass);
 =   ALTER TABLE pedidos.categorias ALTER COLUMN id DROP DEFAULT;
       pedidos          postgres    false    211    210    211            �           2604    33424    clientes id    DEFAULT     l   ALTER TABLE ONLY pedidos.clientes ALTER COLUMN id SET DEFAULT nextval('pedidos.clientes_id_seq'::regclass);
 ;   ALTER TABLE pedidos.clientes ALTER COLUMN id DROP DEFAULT;
       pedidos          postgres    false    214    215    215            �           2604    33445    itens_pedido id    DEFAULT     t   ALTER TABLE ONLY pedidos.itens_pedido ALTER COLUMN id SET DEFAULT nextval('pedidos.itens_pedido_id_seq'::regclass);
 ?   ALTER TABLE pedidos.itens_pedido ALTER COLUMN id DROP DEFAULT;
       pedidos          postgres    false    218    219    219            �           2604    33431 
   pedidos id    DEFAULT     j   ALTER TABLE ONLY pedidos.pedidos ALTER COLUMN id SET DEFAULT nextval('pedidos.pedidos_id_seq'::regclass);
 :   ALTER TABLE pedidos.pedidos ALTER COLUMN id DROP DEFAULT;
       pedidos          postgres    false    217    216    217            �           2604    33410    produtos id    DEFAULT     l   ALTER TABLE ONLY pedidos.produtos ALTER COLUMN id SET DEFAULT nextval('pedidos.produtos_id_seq'::regclass);
 ;   ALTER TABLE pedidos.produtos ALTER COLUMN id DROP DEFAULT;
       pedidos          postgres    false    212    213    213            ?          0    33400 
   categorias 
   TABLE DATA           /   COPY pedidos.categorias (id, nome) FROM stdin;
    pedidos          postgres    false    211   24       C          0    33421    clientes 
   TABLE DATA           4   COPY pedidos.clientes (id, nome, email) FROM stdin;
    pedidos          postgres    false    215   5       G          0    33442    itens_pedido 
   TABLE DATA           U   COPY pedidos.itens_pedido (id, quantidade, preco, pedido_id, produto_id) FROM stdin;
    pedidos          postgres    false    219   �6       E          0    33428    pedidos 
   TABLE DATA           J   COPY pedidos.pedidos (id, data, endereco_entrega, cliente_id) FROM stdin;
    pedidos          postgres    false    217   �7       A          0    33407    produtos 
   TABLE DATA           M   COPY pedidos.produtos (id, nome, descricao, preco, categoria_id) FROM stdin;
    pedidos          postgres    false    213   99       T           0    0    categorias_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('pedidos.categorias_id_seq', 50, true);
          pedidos          postgres    false    210            U           0    0    clientes_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('pedidos.clientes_id_seq', 50, true);
          pedidos          postgres    false    214            V           0    0    itens_pedido_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('pedidos.itens_pedido_id_seq', 50, true);
          pedidos          postgres    false    218            W           0    0    pedidos_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('pedidos.pedidos_id_seq', 50, true);
          pedidos          postgres    false    216            X           0    0    produtos_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('pedidos.produtos_id_seq', 50, true);
          pedidos          postgres    false    212            �           2606    33405    categorias categorias_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY pedidos.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY pedidos.categorias DROP CONSTRAINT categorias_pkey;
       pedidos            postgres    false    211            �           2606    33426    clientes clientes_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY pedidos.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY pedidos.clientes DROP CONSTRAINT clientes_pkey;
       pedidos            postgres    false    215            �           2606    33447    itens_pedido itens_pedido_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY pedidos.itens_pedido
    ADD CONSTRAINT itens_pedido_pkey PRIMARY KEY (id);
 I   ALTER TABLE ONLY pedidos.itens_pedido DROP CONSTRAINT itens_pedido_pkey;
       pedidos            postgres    false    219            �           2606    33435    pedidos pedidos_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY pedidos.pedidos
    ADD CONSTRAINT pedidos_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY pedidos.pedidos DROP CONSTRAINT pedidos_pkey;
       pedidos            postgres    false    217            �           2606    33414    produtos produtos_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY pedidos.produtos
    ADD CONSTRAINT produtos_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY pedidos.produtos DROP CONSTRAINT produtos_pkey;
       pedidos            postgres    false    213            �           1259    33459    idx_clientes_nome    INDEX     G   CREATE INDEX idx_clientes_nome ON pedidos.clientes USING btree (nome);
 &   DROP INDEX pedidos.idx_clientes_nome;
       pedidos            postgres    false    215            �           1259    33458    idx_produtos_nome    INDEX     G   CREATE INDEX idx_produtos_nome ON pedidos.produtos USING btree (nome);
 &   DROP INDEX pedidos.idx_produtos_nome;
       pedidos            postgres    false    213            �           2606    33448 (   itens_pedido itens_pedido_pedido_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY pedidos.itens_pedido
    ADD CONSTRAINT itens_pedido_pedido_id_fkey FOREIGN KEY (pedido_id) REFERENCES pedidos.pedidos(id);
 S   ALTER TABLE ONLY pedidos.itens_pedido DROP CONSTRAINT itens_pedido_pedido_id_fkey;
       pedidos          postgres    false    219    217    3244            �           2606    33453 )   itens_pedido itens_pedido_produto_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY pedidos.itens_pedido
    ADD CONSTRAINT itens_pedido_produto_id_fkey FOREIGN KEY (produto_id) REFERENCES pedidos.produtos(id);
 T   ALTER TABLE ONLY pedidos.itens_pedido DROP CONSTRAINT itens_pedido_produto_id_fkey;
       pedidos          postgres    false    213    219    3239            �           2606    33436    pedidos pedidos_cliente_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY pedidos.pedidos
    ADD CONSTRAINT pedidos_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES pedidos.clientes(id);
 J   ALTER TABLE ONLY pedidos.pedidos DROP CONSTRAINT pedidos_cliente_id_fkey;
       pedidos          postgres    false    215    3241    217            �           2606    33415 #   produtos produtos_categoria_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY pedidos.produtos
    ADD CONSTRAINT produtos_categoria_id_fkey FOREIGN KEY (categoria_id) REFERENCES pedidos.categorias(id);
 N   ALTER TABLE ONLY pedidos.produtos DROP CONSTRAINT produtos_categoria_id_fkey;
       pedidos          postgres    false    211    213    3236            ?   �   x�U�1NE1Dњ�
V�2�$y���/�BB�_�r~y+������������**���QfFMV�bGm���u���)[(A*�$5J�����������%O�J_*}u��iaE���J_�J_M*}���զ�W��:t�z��k�����O'm:}m:}=�����כN__t����y��Y8}.�>�?��t���������������L�|�����A      C   b  x�]�;NCCњ��D�/��m�E)�BA��)г�tS��h�yy�~^�~.��r�����{�}_�������*��+���*X,k�T�w�_�}�58Tptp\�c'�58U0�H�L��f҄�='�c�i҉�uZu�:v���Ȏi�m'�c�iމ�xZxB<6�F�(����g��8��x�ۇ���3�;��g��8��hg�vF;#ΰ3�q���Έ3�vf�ig�3�L;��gڙO��vf�ig�3�L;��gڙ��8��lgƙvf;3δ3�Yq���Ί��vV�eg���,;�i��8{�Ί��vV�eg���,;��g�Y��8��j�%΋��v��n6�?�F�      G   R  x�%�۩1�o��e��L�����+E l%0pX������P�Q�����{�L��{Z��"c��/^~���>~��ӎ�ͯ�=�88���S*���[��$����b�]��H�Ҷd�xi_�-hr��e�b���1HQ���Rܴ7�9m.%s�\l	Mn߰�?����(���b��es�-��esQ�B��7���l�͠d.��0(���V�2��͖h���f+hr���/�>��m�2��Ͷ�2���2h�����&�o6���m�àen�G��<6[bd���02�������_�}�6���<6��`d��c02��C�&�o��yl^
�s�~?�������      E   C  x��սM1��x^��!χ���)�iW��N:����t�"'?G͌[��[�[{������yl�]����������:���B�a�|Z�_���m`~������w;p�0o�k�w勛\�L�	WR{������Jpbp�9�O����w�R����#��;B��0�\�r�D(�.�R�P�/<J��'B����P�/| ���ِJ}�t�R�8��'Nnyiͧe!���ّJ}�H�>qN�R�8w�R�8�R��J�O\�R�W���ĕ(�>q��Kw��:J�O\��'��R�׎R�ׁR�����'v�� �+��      A     x�uջ�1�a��Fp5@�������!k�NRD2�%&�`k�N���������?��7_~������������~�`�۲�_cWc~�	^c�1�q �q�q�8��O5�c���5^�x�9ް]�M������5��x�9>p\�C��q�c[`K�,��1��>�%��,�a�i�3��֤&M�X�Z���$l+Z���5�����VX�$�b�l��M:g�����&��Xq�kp��Y��}���KsL���ܥy�߼�/7X_��e�K�,^��6wi����'��]�g�2���.ͳx��os��Y��}���K�,^�~��ܥy/s.`�S��1��9�y�9lsJ�,|>��r�<����ǻ�`�S�ga�s�mNi��e�lsJ�,,sn`�S�ga�sۜ�<˜���YX� �<�y<�u�m�<K�y8��C�g�2"�<�y�x���e������_��c"�<�y�(�Xm�<K�yl�6i�%�<vD��4�e��C�g�2�f�Oi>��?���%�	\     