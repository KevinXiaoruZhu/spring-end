/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/3/8 14:37:30                            */
/*==============================================================*/


alter table ykat_bankcard_relations
   drop primary key;

drop table if exists ykat_bankcard_relations;

alter table ykat_bankcards
   drop primary key;

drop table if exists ykat_bankcards;

alter table ykat_deposit_recharge_records
   drop primary key;

drop table if exists ykat_deposit_recharge_records;

alter table ykat_drivers
   drop primary key;

drop table if exists ykat_drivers;

alter table ykat_employee_relations
   drop primary key;

drop table if exists ykat_employee_relations;

alter table ykat_kbs
   drop primary key;

drop table if exists ykat_kbs;

alter table ykat_logs
   drop primary key;

drop table if exists ykat_logs;

drop index xk_order_id on ykat_orders;

alter table ykat_orders
   drop primary key;

drop table if exists ykat_orders;

alter table ykat_projects
   drop primary key;

drop table if exists ykat_projects;

drop index xk_set_acc_id on ykat_settle_account_records;

alter table ykat_settle_account_records
   drop primary key;

drop table if exists ykat_settle_account_records;

alter table ykat_stores
   drop primary key;

drop table if exists ykat_stores;

drop index xk_phone on ykat_users;

alter table ykat_users
   drop primary key;

drop table if exists ykat_users;

/*==============================================================*/
/* Table: ykat_bankcard_relations                               */
/*==============================================================*/
create table ykat_bankcard_relations
(
   id                   int not null auto_increment comment '编号',
   bankcard_id          int comment '银行卡ID',
   store_id             int comment '门店ID'
);

alter table ykat_bankcard_relations
   add primary key (id);

/*==============================================================*/
/* Table: ykat_bankcards                                        */
/*==============================================================*/
create table ykat_bankcards
(
   id                   int not null auto_increment comment '编号',
   card_id              varchar(30) comment '银行卡卡号',
   type                 varchar(20) comment '银行卡类型',
   owner_name           varchar(20) comment '所属人姓名',
   owner_id_card        varchar(30) comment '所属人身份证',
   bank_name            varchar(30) comment '银行名称'
);

alter table ykat_bankcards
   add primary key (id);

/*==============================================================*/
/* Table: ykat_deposit_recharge_records                         */
/*==============================================================*/
create table ykat_deposit_recharge_records
(
   id                   int not null auto_increment comment '编号',
   recharge_money       int comment '补足金额',
   recharge_time        datetime comment '补足时间',
   store_id             int comment '门店ID',
   created_at           datetime comment '创建时间'
);

alter table ykat_deposit_recharge_records
   add primary key (id);

/*==============================================================*/
/* Table: ykat_drivers                                          */
/*==============================================================*/
create table ykat_drivers
(
   id                   int not null auto_increment comment '编号',
   balance              int comment '余额',
   driver_name          varchar(20) comment '司机名称',
   driver_phone         varchar(20) comment '司机电话号',
   created_at           datetime comment '创建时间'
);

alter table ykat_drivers
   add primary key (id);

/*==============================================================*/
/* Table: ykat_employee_relations                               */
/*==============================================================*/
create table ykat_employee_relations
(
   id                   int not null auto_increment comment '编号',
   employee_id          int comment '雇员ID',
   store_id             int comment '门店ID'
);

alter table ykat_employee_relations
   add primary key (id);

/*==============================================================*/
/* Table: ykat_kbs                                              */
/*==============================================================*/
create table ykat_kbs
(
   id                   int not null auto_increment comment '编号',
   name                 varchar(20) comment '知识名',
   type                 varchar(40) comment '知识类型',
   descp                varchar(1024) comment '知识描述',
   created_at           datetime comment '创建时间'
);

alter table ykat_kbs
   add primary key (id);

/*==============================================================*/
/* Table: ykat_logs                                             */
/*==============================================================*/
create table ykat_logs
(
   id                   int not null auto_increment comment '编号',
   opt_usr_id           int comment '操作者ID',
   opt_type             varchar(40) comment '操作类型',
   opt_descp            varchar(512) comment '操作内容',
   operation_at         datetime comment '创建时间'
);

alter table ykat_logs
   add primary key (id);

/*==============================================================*/
/* Table: ykat_orders                                           */
/*==============================================================*/
create table ykat_orders
(
   id                   int not null auto_increment comment '编号',
   type                 varchar(20) comment '订单类型',
   status               int comment '订单状态',
   order_id             varchar(30) comment '订单号',
   project_id           int comment '项目编号',
   store_id             int comment '门店ID',
   driver_id            int comment '司机ID',
   created_at           datetime comment '创建时间',
   ordered_at           datetime comment '预约时间'
);

alter table ykat_orders
   add primary key (id);

/*==============================================================*/
/* Index: xk_order_id                                           */
/*==============================================================*/
create unique index xk_order_id on ykat_orders
(
   order_id
);

/*==============================================================*/
/* Table: ykat_projects                                         */
/*==============================================================*/
create table ykat_projects
(
   id                   int not null auto_increment comment '编号',
   price                int comment '项目价格',
   type                 varchar(50) comment '项目类型',
   descp                varchar(1024) comment '项目描述'
);

alter table ykat_projects
   add primary key (id);

/*==============================================================*/
/* Table: ykat_settle_account_records                           */
/*==============================================================*/
create table ykat_settle_account_records
(
   id                   int not null auto_increment comment '编号',
   set_acc_id           varchar(30) comment '结算单号',
   trade_money          int comment '交易金额',
   status               int comment '结算状态',
   traded_at            datetime comment '结算时间',
   created_at           datetime comment '创建时间',
   order_id             int comment '订单编号'
);

alter table ykat_settle_account_records
   add primary key (id);

/*==============================================================*/
/* Index: xk_set_acc_id                                         */
/*==============================================================*/
create unique index xk_set_acc_id on ykat_settle_account_records
(
   set_acc_id
);

/*==============================================================*/
/* Table: ykat_stores                                           */
/*==============================================================*/
create table ykat_stores
(
   id                   int not null auto_increment comment '编号',
   company_name         varchar(64) comment '公司名称',
   id_card              varchar(30) comment '身份证号',
   pic_head_url         varchar(100) comment '身份证正面照URL',
   pic_tail_url         varchar(100) comment '身份证反面照URL',
   service_type         varchar(50) comment '服务类型',
   location             varchar(120) comment '位置信息',
   user_id              int comment 'user表ID',
   deposit              int comment '保证金总额',
   reserve_phone        varchar(30) comment '备用电话'
);

alter table ykat_stores
   add primary key (id);

/*==============================================================*/
/* Table: ykat_users                                            */
/*==============================================================*/
create table ykat_users
(
   id                   int not null auto_increment comment '编号',
   name                 varchar(20) comment '姓名',
   password             varchar(64) comment '密码',
   role                 int comment '角色',
   phone                varchar(20) comment '电话',
   created_at           datetime comment '创建时间'
);

alter table ykat_users
   add primary key (id);

/*==============================================================*/
/* Index: xk_phone                                              */
/*==============================================================*/
create unique index xk_phone on ykat_users
(
   phone
);

alter table ykat_bankcard_relations add constraint FK_Reference_10 foreign key (bankcard_id)
      references ykat_bankcards (id) on delete restrict on update restrict;

alter table ykat_bankcard_relations add constraint FK_Reference_9 foreign key (store_id)
      references ykat_stores (id) on delete restrict on update restrict;

alter table ykat_deposit_recharge_records add constraint FK_Reference_8 foreign key (store_id)
      references ykat_stores (id) on delete restrict on update restrict;

alter table ykat_employee_relations add constraint FK_Reference_2 foreign key (employee_id)
      references ykat_users (id) on delete restrict on update restrict;

alter table ykat_employee_relations add constraint FK_Reference_3 foreign key (store_id)
      references ykat_stores (id) on delete restrict on update restrict;

alter table ykat_logs add constraint FK_Reference_14 foreign key (opt_usr_id)
      references ykat_users (id) on delete restrict on update restrict;

alter table ykat_orders add constraint FK_Reference_11 foreign key (store_id)
      references ykat_stores (id) on delete restrict on update restrict;

alter table ykat_orders add constraint FK_Reference_12 foreign key (driver_id)
      references ykat_drivers (id) on delete restrict on update restrict;

alter table ykat_orders add constraint FK_Reference_4 foreign key (project_id)
      references ykat_projects (id) on delete restrict on update restrict;

alter table ykat_settle_account_records add constraint FK_Reference_13 foreign key (order_id)
      references ykat_orders (id) on delete restrict on update restrict;

alter table ykat_stores add constraint FK_Reference_1 foreign key (user_id)
      references ykat_users (id) on delete restrict on update restrict;
