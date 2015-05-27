require 'logging'

class Logger

	# here we setup a color scheme called 'bright'
    Logging.color_scheme( 'bright',
      :levels => {
      :info  => :green,
      :warn  => :yellow,
      :error => :red,
      :fatal => [:white, :on_red]
    },
    :date => :blue,
    :logger => :cyan,
    :message => :green
	  )

	Logging.appenders.stdout(
	    'stdout',
	    :layout => Logging.layouts.pattern(
	      :pattern => '[%d] %-5l %c: %m\n',
	      :color_scheme => 'bright'
	    )
	  )


	$logger = Logging.logger['my_logger']
	$logger.level = :info
	$logger.add_appenders \
	    Logging.appenders.stdout,
	    Logging.appenders.file('./logs/errors.log')

	def self.log argument, type
		case type
			when 'debug'
				$logger.debug argument
			when 'info'
				$logger.info argument
			when 'warn'
				$logger.warn argument
			when 'error'
				$logger.error argument
			when 'fatal'
				$logger.fatal argument
		end
			
	end

end