PGDMP      
            	    {            create_and_insert    16.0    16.0     !           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            "           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            #           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            $           1262    16410    create_and_insert    DATABASE     }   CREATE DATABASE create_and_insert WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';
 !   DROP DATABASE create_and_insert;
                postgres    false            �            1255    16464    random_name(integer)    FUNCTION     v  CREATE FUNCTION public.random_name(length integer) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
    characters TEXT := 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
    result TEXT := '';
BEGIN
    FOR i IN 1..length LOOP
        result := result || substr(characters, floor(random() * length(characters) + 1), 1);
    END LOOP;
    RETURN result;
END;
$$;
 2   DROP FUNCTION public.random_name(length integer);
       public          postgres    false            �            1255    16465    random_password(integer)    FUNCTION     �   CREATE FUNCTION public.random_password(length integer) RETURNS text
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN lpad(floor(random() * 1000000)::TEXT, length, '0');
END;
$$;
 6   DROP FUNCTION public.random_password(length integer);
       public          postgres    false            �            1259    16421    akun    TABLE     �   CREATE TABLE public.akun (
    id_akun bigint NOT NULL,
    id_nasabah integer NOT NULL,
    no_rekening character varying(255) NOT NULL,
    saldo integer NOT NULL
);
    DROP TABLE public.akun;
       public         heap    postgres    false            �            1259    16420    akun_id_akun_seq    SEQUENCE     y   CREATE SEQUENCE public.akun_id_akun_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.akun_id_akun_seq;
       public          postgres    false    218            %           0    0    akun_id_akun_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.akun_id_akun_seq OWNED BY public.akun.id_akun;
          public          postgres    false    217            �            1259    16412    nasabah    TABLE     �   CREATE TABLE public.nasabah (
    id_nasabah bigint NOT NULL,
    nama character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(50) NOT NULL
);
    DROP TABLE public.nasabah;
       public         heap    postgres    false            �            1259    16411    nasabah_id_nasabah_seq    SEQUENCE        CREATE SEQUENCE public.nasabah_id_nasabah_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.nasabah_id_nasabah_seq;
       public          postgres    false    216            &           0    0    nasabah_id_nasabah_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.nasabah_id_nasabah_seq OWNED BY public.nasabah.id_nasabah;
          public          postgres    false    215            �            1259    16443 	   transaksi    TABLE     �   CREATE TABLE public.transaksi (
    id_transaksi bigint NOT NULL,
    id_akun integer NOT NULL,
    jenis_transaksi text NOT NULL,
    jumlah_transaksi numeric(15,2) NOT NULL,
    tanggal_transaksi date NOT NULL
);
    DROP TABLE public.transaksi;
       public         heap    postgres    false            �            1259    16442    transaksi_id_transaksi_seq    SEQUENCE     �   CREATE SEQUENCE public.transaksi_id_transaksi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.transaksi_id_transaksi_seq;
       public          postgres    false    220            '           0    0    transaksi_id_transaksi_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.transaksi_id_transaksi_seq OWNED BY public.transaksi.id_transaksi;
          public          postgres    false    219            �           2604    16424    akun id_akun    DEFAULT     l   ALTER TABLE ONLY public.akun ALTER COLUMN id_akun SET DEFAULT nextval('public.akun_id_akun_seq'::regclass);
 ;   ALTER TABLE public.akun ALTER COLUMN id_akun DROP DEFAULT;
       public          postgres    false    218    217    218                       2604    16415    nasabah id_nasabah    DEFAULT     x   ALTER TABLE ONLY public.nasabah ALTER COLUMN id_nasabah SET DEFAULT nextval('public.nasabah_id_nasabah_seq'::regclass);
 A   ALTER TABLE public.nasabah ALTER COLUMN id_nasabah DROP DEFAULT;
       public          postgres    false    215    216    216            �           2604    16446    transaksi id_transaksi    DEFAULT     �   ALTER TABLE ONLY public.transaksi ALTER COLUMN id_transaksi SET DEFAULT nextval('public.transaksi_id_transaksi_seq'::regclass);
 E   ALTER TABLE public.transaksi ALTER COLUMN id_transaksi DROP DEFAULT;
       public          postgres    false    219    220    220                      0    16421    akun 
   TABLE DATA           G   COPY public.akun (id_akun, id_nasabah, no_rekening, saldo) FROM stdin;
    public          postgres    false    218   �!                 0    16412    nasabah 
   TABLE DATA           D   COPY public.nasabah (id_nasabah, nama, email, password) FROM stdin;
    public          postgres    false    216   �!                 0    16443 	   transaksi 
   TABLE DATA           p   COPY public.transaksi (id_transaksi, id_akun, jenis_transaksi, jumlah_transaksi, tanggal_transaksi) FROM stdin;
    public          postgres    false    220   n"       (           0    0    akun_id_akun_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.akun_id_akun_seq', 2, true);
          public          postgres    false    217            )           0    0    nasabah_id_nasabah_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.nasabah_id_nasabah_seq', 2001, true);
          public          postgres    false    215            *           0    0    transaksi_id_transaksi_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.transaksi_id_transaksi_seq', 3, true);
          public          postgres    false    219            �           2606    16426    akun akun_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.akun
    ADD CONSTRAINT akun_pkey PRIMARY KEY (id_akun);
 8   ALTER TABLE ONLY public.akun DROP CONSTRAINT akun_pkey;
       public            postgres    false    218            �           2606    16419    nasabah nasabah_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.nasabah
    ADD CONSTRAINT nasabah_pkey PRIMARY KEY (id_nasabah);
 >   ALTER TABLE ONLY public.nasabah DROP CONSTRAINT nasabah_pkey;
       public            postgres    false    216            �           2606    16450    transaksi transaksi_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.transaksi
    ADD CONSTRAINT transaksi_pkey PRIMARY KEY (id_transaksi);
 B   ALTER TABLE ONLY public.transaksi DROP CONSTRAINT transaksi_pkey;
       public            postgres    false    220            �           2606    16437    akun fkey_id_nasabah    FK CONSTRAINT     �   ALTER TABLE ONLY public.akun
    ADD CONSTRAINT fkey_id_nasabah FOREIGN KEY (id_nasabah) REFERENCES public.nasabah(id_nasabah);
 >   ALTER TABLE ONLY public.akun DROP CONSTRAINT fkey_id_nasabah;
       public          postgres    false    216    218    3459            �           2606    16451     transaksi transaksi_id_akun_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.transaksi
    ADD CONSTRAINT transaksi_id_akun_fkey FOREIGN KEY (id_akun) REFERENCES public.akun(id_akun);
 J   ALTER TABLE ONLY public.transaksi DROP CONSTRAINT transaksi_id_akun_fkey;
       public          postgres    false    220    3461    218               _   x�-��� C�a
&�S������h�r������1���h�Y �=%��гᬉ� j���^Ojw�[ s�JS< �#(0�����}�%:         f   x�=˻
�0F����M�swG]�H-U�ŷ���|��ڰ���OkHK5�
Q���[�������1�T���=�Va'�h-�?�l����"4TDtm$�         T   x�e�K
�0E�q�����.ƉP��-�};?wz���Y�R�餤��JP�h����Y �]�y[���� 17�?�����o}�     