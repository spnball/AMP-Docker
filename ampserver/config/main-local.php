<?php
/**
 * params-local.php
 *
 * @author: antonio ramirez <antonio@clevertech.biz>
 * Date: 7/22/12
 * Time: 5:59 PM
 *
 *
 * ANY CONFIGURATION OPTIONS HERE WILL REPLACE THOSE INCLUDED ON THE params-env.php file!!!
 * It holds your local configuration settings.
 *
 * Replace following tokens for your local correspondent configuration data
 *
 * {DATABASE-NAME}Â ->   database name
 * {DATABASE-HOST} -> database server host name or ip address
 * {DATABASE-USERNAME} -> user name access
 * {DATABASE-PASSWORD} -> user password
 *
 * {DATABASE-TEST-NAME}Â ->   Test database name
 * {DATABASE-TEST-HOST} -> Test database server host name or ip address
 * {DATABASE-USERNAME} -> Test user name access
 * {DATABASE-PASSWORD} -> Test user password
 */
return array(
	'env.code' => 'private',
	
	// DB connection configurations
	'db.name' => '',
	'db.connectionString' => 'mysql:host=database;dbname=acommerce',
	'db.username' => 'root',
	'db.password' => 'badboy',
	
	// partner database {
	'partner_db.name' => '',
	'partner_db.connectionString' => 'mysql:host={DATABASE-HOST};dbname={DATABASE-NAME}',
	'partner_db.username' => '{DATABASE-USERNAME}',
	'partner_db.password' => '{DATABASE-PASSWORD}',

	// shipment database {
	'shipment_db.name' => '',
	'shipment_db.connectionString' => 'mysql:host=database;dbname=acommerce_shipment',
	'shipment_db.username' => 'root',
	'shipment_db.password' => 'badboy',

	'adelivery_db.name' => '',
	'adelivery_db.connectionString' => 'mysql:host=database;dbname=acommerce_shipment',
	'adelivery_db.username' => 'root',
	'adelivery_db.password' => 'badboy',

	'netsuite_db.name' => '',
	'netsuite_db.connectionString' => 'mysql:host=database;dbname=magento_netsuite',
	'netsuite_db.username' => 'root',
	'netsuite_db.password' => 'badboy',

	'external_tracking_db.name' => '',
	'external_tracking_db.connectionString' => 'mysql:host=database;dbname=acommerce_external_tracking',
	'external_tracking_db.username' => 'root',
	'external_tracking_db.password' => 'badboy',

	// delete order database
	'delete_db.name' => '',
	'delete_db.connectionString' => 'mysql:host=database;dbname=acommerce_delete',
	'delete_db.username' => 'root',
	'delete_db.password' => 'badboy',
//
//	// test database {
//	'testdb.name' => '',
//	'testdb.connectionString' => 'mysql:host={DATABASE-HOST};dbname={DATABASE-NAME}_test',
//	'testdb.username' => '{DATABASE-USERNAME}',
//	'testdb.password' => '{DATABASE-PASSWORD}',

);
