dataSource {
    pooled = true
    driverClassName = "org.h2.Driver"
    username = "sa"
    password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:h2:pmoDev;MVCC=TRUE"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE"
        }
    }
	rrtdev{
		
		dataSource {
			dbCreate = "update"
			driverClassName = "com.mysql.jdbc.Driver"
			username = "pmo"
			password =  "pmo" 
			url = "jdbc:mysql://184.106.212.88/pmo"			
		}	
	}
	andrewdev{
		
		dataSource {
			dbCreate = "update"
			driverClassName = "com.mysql.jdbc.Driver"
			username = "pmo"
			password =  "pmo"
			url = "jdbc:mysql://localhost/pmo"
		}
	}

    production {
        dataSource {
            dbCreate = "update"
			driverClassName = "com.mysql.jdbc.Driver"
			username = "pmo"
			password =  "pmo"
			url = "jdbc:mysql://172.16.65.54/pmo"
            pooled = true
            properties {
               maxActive = -1
               minEvictableIdleTimeMillis=1800000
               timeBetweenEvictionRunsMillis=1800000
               numTestsPerEvictionRun=3
               testOnBorrow=true
               testWhileIdle=true
               testOnReturn=true
               validationQuery="SELECT 1"
            }
        }
    }
}
