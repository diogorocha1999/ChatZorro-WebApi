PGDMP     *    7                y        	   chatzorro    13.2 (Debian 13.2-1.pgdg100+1)    13.2 4    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16801 	   chatzorro    DATABASE     ]   CREATE DATABASE chatzorro WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';
    DROP DATABASE chatzorro;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   postgres    false    3            �            1259    18156    tbl_attachments    TABLE     �   CREATE TABLE public.tbl_attachments (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    id_message integer NOT NULL,
    type character varying(10) NOT NULL,
    path character varying(255) NOT NULL
);
 #   DROP TABLE public.tbl_attachments;
       public         heap    postgres    false    3            �            1259    18154    tbl_attachments_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_attachments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.tbl_attachments_id_seq;
       public          postgres    false    3    201            �           0    0    tbl_attachments_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.tbl_attachments_id_seq OWNED BY public.tbl_attachments.id;
          public          postgres    false    200            �            1259    18164    tbl_groupchat    TABLE     �   CREATE TABLE public.tbl_groupchat (
    id_groupchat integer NOT NULL,
    name character varying(50) NOT NULL,
    photo bytea
);
 !   DROP TABLE public.tbl_groupchat;
       public         heap    postgres    false    3            �            1259    18162    tbl_groupchat_id_groupchat_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_groupchat_id_groupchat_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.tbl_groupchat_id_groupchat_seq;
       public          postgres    false    203    3            �           0    0    tbl_groupchat_id_groupchat_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.tbl_groupchat_id_groupchat_seq OWNED BY public.tbl_groupchat.id_groupchat;
          public          postgres    false    202            �            1259    18173    tbl_groupchat_user_relationship    TABLE     �   CREATE TABLE public.tbl_groupchat_user_relationship (
    id_groupchat integer NOT NULL,
    id_user integer NOT NULL,
    admin boolean NOT NULL
);
 3   DROP TABLE public.tbl_groupchat_user_relationship;
       public         heap    postgres    false    3            �            1259    18178    tbl_message    TABLE       CREATE TABLE public.tbl_message (
    id_message integer NOT NULL,
    id_user integer NOT NULL,
    id_groupchat integer NOT NULL,
    creation_date timestamp without time zone DEFAULT now() NOT NULL,
    send_date timestamp without time zone,
    body text NOT NULL
);
    DROP TABLE public.tbl_message;
       public         heap    postgres    false    3            �            1259    18176    tbl_message_id_message_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_message_id_message_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.tbl_message_id_message_seq;
       public          postgres    false    3    206            �           0    0    tbl_message_id_message_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.tbl_message_id_message_seq OWNED BY public.tbl_message.id_message;
          public          postgres    false    205            �            1259    18188    tbl_receivedmessages    TABLE     �   CREATE TABLE public.tbl_receivedmessages (
    id_message integer NOT NULL,
    id_user integer NOT NULL,
    received_date timestamp without time zone DEFAULT now() NOT NULL
);
 (   DROP TABLE public.tbl_receivedmessages;
       public         heap    postgres    false    3            �            1259    18192    tbl_response    TABLE     i   CREATE TABLE public.tbl_response (
    id_message1 integer NOT NULL,
    id_message2 integer NOT NULL
);
     DROP TABLE public.tbl_response;
       public         heap    postgres    false    3            �            1259    18197    tbl_user    TABLE       CREATE TABLE public.tbl_user (
    id_user integer NOT NULL,
    firstname character varying(50) NOT NULL,
    lastname character varying(50),
    username character varying(30),
    password character varying(25) NOT NULL,
    photo bytea,
    inactive boolean NOT NULL
);
    DROP TABLE public.tbl_user;
       public         heap    postgres    false    3            �            1259    18195    tbl_user_id_user_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_user_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.tbl_user_id_user_seq;
       public          postgres    false    210    3            �           0    0    tbl_user_id_user_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.tbl_user_id_user_seq OWNED BY public.tbl_user.id_user;
          public          postgres    false    209                       2604    18159    tbl_attachments id    DEFAULT     x   ALTER TABLE ONLY public.tbl_attachments ALTER COLUMN id SET DEFAULT nextval('public.tbl_attachments_id_seq'::regclass);
 A   ALTER TABLE public.tbl_attachments ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    201    200    201                       2604    18167    tbl_groupchat id_groupchat    DEFAULT     �   ALTER TABLE ONLY public.tbl_groupchat ALTER COLUMN id_groupchat SET DEFAULT nextval('public.tbl_groupchat_id_groupchat_seq'::regclass);
 I   ALTER TABLE public.tbl_groupchat ALTER COLUMN id_groupchat DROP DEFAULT;
       public          postgres    false    202    203    203                       2604    18181    tbl_message id_message    DEFAULT     �   ALTER TABLE ONLY public.tbl_message ALTER COLUMN id_message SET DEFAULT nextval('public.tbl_message_id_message_seq'::regclass);
 E   ALTER TABLE public.tbl_message ALTER COLUMN id_message DROP DEFAULT;
       public          postgres    false    206    205    206                       2604    18200    tbl_user id_user    DEFAULT     t   ALTER TABLE ONLY public.tbl_user ALTER COLUMN id_user SET DEFAULT nextval('public.tbl_user_id_user_seq'::regclass);
 ?   ALTER TABLE public.tbl_user ALTER COLUMN id_user DROP DEFAULT;
       public          postgres    false    209    210    210            �          0    18156    tbl_attachments 
   TABLE DATA           K   COPY public.tbl_attachments (id, name, id_message, type, path) FROM stdin;
    public          postgres    false    201            �          0    18164    tbl_groupchat 
   TABLE DATA           B   COPY public.tbl_groupchat (id_groupchat, name, photo) FROM stdin;
    public          postgres    false    203            �          0    18173    tbl_groupchat_user_relationship 
   TABLE DATA           W   COPY public.tbl_groupchat_user_relationship (id_groupchat, id_user, admin) FROM stdin;
    public          postgres    false    204            �          0    18178    tbl_message 
   TABLE DATA           h   COPY public.tbl_message (id_message, id_user, id_groupchat, creation_date, send_date, body) FROM stdin;
    public          postgres    false    206            �          0    18188    tbl_receivedmessages 
   TABLE DATA           R   COPY public.tbl_receivedmessages (id_message, id_user, received_date) FROM stdin;
    public          postgres    false    207            �          0    18192    tbl_response 
   TABLE DATA           @   COPY public.tbl_response (id_message1, id_message2) FROM stdin;
    public          postgres    false    208            �          0    18197    tbl_user 
   TABLE DATA           e   COPY public.tbl_user (id_user, firstname, lastname, username, password, photo, inactive) FROM stdin;
    public          postgres    false    210            �           0    0    tbl_attachments_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.tbl_attachments_id_seq', 1, false);
          public          postgres    false    200            �           0    0    tbl_groupchat_id_groupchat_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.tbl_groupchat_id_groupchat_seq', 3, true);
          public          postgres    false    202            �           0    0    tbl_message_id_message_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.tbl_message_id_message_seq', 6, true);
          public          postgres    false    205            �           0    0    tbl_user_id_user_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.tbl_user_id_user_seq', 9, true);
          public          postgres    false    209                       2606    18161 $   tbl_attachments tbl_attachments_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.tbl_attachments
    ADD CONSTRAINT tbl_attachments_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.tbl_attachments DROP CONSTRAINT tbl_attachments_pkey;
       public            postgres    false    201                       2606    18172     tbl_groupchat tbl_groupchat_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.tbl_groupchat
    ADD CONSTRAINT tbl_groupchat_pkey PRIMARY KEY (id_groupchat);
 J   ALTER TABLE ONLY public.tbl_groupchat DROP CONSTRAINT tbl_groupchat_pkey;
       public            postgres    false    203            !           2606    18187    tbl_message tbl_message_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.tbl_message
    ADD CONSTRAINT tbl_message_pkey PRIMARY KEY (id_message);
 F   ALTER TABLE ONLY public.tbl_message DROP CONSTRAINT tbl_message_pkey;
       public            postgres    false    206            $           2606    18205    tbl_user tbl_user_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.tbl_user
    ADD CONSTRAINT tbl_user_pkey PRIMARY KEY (id_user);
 @   ALTER TABLE ONLY public.tbl_user DROP CONSTRAINT tbl_user_pkey;
       public            postgres    false    210                       1259    18206    tbl_attachments_id    INDEX     S   CREATE UNIQUE INDEX tbl_attachments_id ON public.tbl_attachments USING btree (id);
 &   DROP INDEX public.tbl_attachments_id;
       public            postgres    false    201                       1259    18207    tbl_groupchat_id_groupchat    INDEX     c   CREATE UNIQUE INDEX tbl_groupchat_id_groupchat ON public.tbl_groupchat USING btree (id_groupchat);
 .   DROP INDEX public.tbl_groupchat_id_groupchat;
       public            postgres    false    203            "           1259    18208    tbl_user_id_user    INDEX     O   CREATE UNIQUE INDEX tbl_user_id_user ON public.tbl_user USING btree (id_user);
 $   DROP INDEX public.tbl_user_id_user;
       public            postgres    false    210            (           2606    18244    tbl_message Select    FK CONSTRAINT     �   ALTER TABLE ONLY public.tbl_message
    ADD CONSTRAINT "Select" FOREIGN KEY (id_groupchat) REFERENCES public.tbl_groupchat(id_groupchat);
 >   ALTER TABLE ONLY public.tbl_message DROP CONSTRAINT "Select";
       public          postgres    false    206    2847    203            &           2606    18214 1   tbl_groupchat_user_relationship containsgroupchat    FK CONSTRAINT     �   ALTER TABLE ONLY public.tbl_groupchat_user_relationship
    ADD CONSTRAINT containsgroupchat FOREIGN KEY (id_groupchat) REFERENCES public.tbl_groupchat(id_groupchat);
 [   ALTER TABLE ONLY public.tbl_groupchat_user_relationship DROP CONSTRAINT containsgroupchat;
       public          postgres    false    204    203    2847            '           2606    18219 ,   tbl_groupchat_user_relationship containsuser    FK CONSTRAINT     �   ALTER TABLE ONLY public.tbl_groupchat_user_relationship
    ADD CONSTRAINT containsuser FOREIGN KEY (id_user) REFERENCES public.tbl_user(id_user);
 V   ALTER TABLE ONLY public.tbl_groupchat_user_relationship DROP CONSTRAINT containsuser;
       public          postgres    false    2852    210    204            ,           2606    18209    tbl_response fktbl_respon716101    FK CONSTRAINT     �   ALTER TABLE ONLY public.tbl_response
    ADD CONSTRAINT fktbl_respon716101 FOREIGN KEY (id_message1) REFERENCES public.tbl_message(id_message);
 I   ALTER TABLE ONLY public.tbl_response DROP CONSTRAINT fktbl_respon716101;
       public          postgres    false    206    2849    208            %           2606    18224    tbl_attachments included    FK CONSTRAINT     �   ALTER TABLE ONLY public.tbl_attachments
    ADD CONSTRAINT included FOREIGN KEY (id_message) REFERENCES public.tbl_message(id_message);
 B   ALTER TABLE ONLY public.tbl_attachments DROP CONSTRAINT included;
       public          postgres    false    206    201    2849            *           2606    18229 $   tbl_receivedmessages receivedmessage    FK CONSTRAINT     �   ALTER TABLE ONLY public.tbl_receivedmessages
    ADD CONSTRAINT receivedmessage FOREIGN KEY (id_message) REFERENCES public.tbl_message(id_message);
 N   ALTER TABLE ONLY public.tbl_receivedmessages DROP CONSTRAINT receivedmessage;
       public          postgres    false    207    2849    206            +           2606    18234 !   tbl_receivedmessages receiveduser    FK CONSTRAINT     �   ALTER TABLE ONLY public.tbl_receivedmessages
    ADD CONSTRAINT receiveduser FOREIGN KEY (id_user) REFERENCES public.tbl_user(id_user);
 K   ALTER TABLE ONLY public.tbl_receivedmessages DROP CONSTRAINT receiveduser;
       public          postgres    false    207    2852    210            -           2606    18239    tbl_response responses    FK CONSTRAINT     �   ALTER TABLE ONLY public.tbl_response
    ADD CONSTRAINT responses FOREIGN KEY (id_message2) REFERENCES public.tbl_message(id_message);
 @   ALTER TABLE ONLY public.tbl_response DROP CONSTRAINT responses;
       public          postgres    false    2849    206    208            )           2606    18249    tbl_message sends    FK CONSTRAINT     x   ALTER TABLE ONLY public.tbl_message
    ADD CONSTRAINT sends FOREIGN KEY (id_user) REFERENCES public.tbl_user(id_user);
 ;   ALTER TABLE ONLY public.tbl_message DROP CONSTRAINT sends;
       public          postgres    false    210    206    2852            �      x������ � �      �   .   x�3�JU��K���2�)JLJ���/Vptt	#���qqq _�      �   +   x�3�4�,�2�4�L��`�(b�i&̀"F��@v� �w5      �   �   x�u�K� ��1��.@�^�謮�	�5%�j@������)�l���M��)�D�;6�,�~R����w����L1�V�;<?.�$Z+.˔���6
>	s�+���}����'؏@���u��F��n(����?dʀ�asy�sN��
��)�O�s��vI|      �      x������ � �      �      x������ � �      �     x�]��N�0��0+߷�I;Q$>$$�����EWnZP߆g��H��VNq�����5���'�(Ȧ����ʈ�)���5���r(����|��i�h�>~ۉ��K�)���VF�my�jT���V�F���')��+[��{�yۊT��Q�QI���ǁ]Ľ��K<'Z�Z8J�

TF�'�P����_6�u�o���r�#�H�X:�Ϲ#/�(�H�"=H�ff>&c��{<,�B�����G��A�ói��YǶ�ċ$�*��ٯ�,����     