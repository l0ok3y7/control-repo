node 'node1' {
  
  notify { "*** Node 1 ***":}
  
  include base
  
  class {'::tomcat':
    xms           => '50m',
    xmx           => '120m', 
    user          => 'tomcat',
    group         => 'tomcat',
    service_state => 'running',
  }
  
  tomcat::deploy { "sysfoo":
    deploy_url     => 'https://2-111237108-gh.circle-artifacts.com/0/tmp/circle-artifacts.Ra4zn2J/sysfoo.war',
    checksum_value => '47926753bd181323b4ceb81e3dad129a',
  }
}

node 'node2' {

    notify { "*** Node 2 ***":}

    include base

    class {'::tomcat':
    xms           => '150m',
    xmx           => '220m', 
    user          => 'tomcat',
    group         => 'tomcat',
    service_state => 'running',
  }

  tomcat::deploy { "sysfoo":
    deploy_url     => 'https://2-111237108-gh.circle-artifacts.com/0/tmp/circle-artifacts.Ra4zn2J/sysfoo.war',
    checksum_value => '47926753bd181323b4ceb81e3dad129a',
  }
  
}

node default {
  notify { 'checkpoint_1':
    message => "
      checkpoint_123
      
      Applying default configuration
    
    "
    }
}