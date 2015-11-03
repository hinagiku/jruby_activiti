# JrubyActiviti

You can directly access Activiti BPM in Ruby Web Application.

## Test Environments
JRuby-9.0.3.0, Activiti-5.18.0

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jruby_activiti'
```

create a `Jarfile`. Example:

```
jar 'org.activiti:activiti-engine', '~> 5.18'
jar 'org.slf4j:slf4j-log4j12', '>= 1.7'
jar 'com.h2database:h2', '>= 1.4'
``` 

And then execute:
```
$ bundle install
$ jbundle install
```

## Usage

Create activiti config file. `config/activiti.cfg.xml`
```
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans   http://www.springframework.org/schema/beans/spring-beans.xsd">

  <bean id="processEngineConfiguration" class="org.activiti.engine.impl.cfg.StandaloneProcessEngineConfiguration">
    <property name="jdbcUrl" value="jdbc:h2:mem:activiti;DB_CLOSE_DELAY=1000" />
    <property name="jdbcDriver" value="org.h2.Driver" />
    <property name="jdbcUsername" value="sa" />
    <property name="jdbcPassword" value="" />
  </bean>

</beans>
```

Now, You can access Activiti directly by using `ActivitiEngine`. For example, in a Rails controller

```
repositoryService = ActivitiEngine.getRepositoryService()
repositoryService.createDeployment().
  addClasspathResource("config/your_bpm_xml_file.bpmn20.xml").
  deploy()
```

## Warning
Do not create Activiti Engine in a Rails application repeatedly. Otherwise you will get exception `log writing failed. Bad file descriptor - Bad file descriptor`

## Thanks
Inspired by https://github.com/boberetezeke/jruby-activiti

## Contributing

1. Fork it ( https://github.com/richfisher/jruby_activiti/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
