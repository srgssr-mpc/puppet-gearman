class gearman::params {
    case $operatingsystem {
        /(Ubuntu|Debian)/: {
            $package_name = 'gearman-job-server'
            $config_file = '/etc/default/gearman-job-server'
            $service_name = 'gearman-job-server'
        }
    }

    case $gearman_job_retries {
        '': { $job_retries = '--job-retries=0' }
        default: { $job_retries = "--job-retries=${gearman_job_retries}" }
    }

    case $gearman_port {
        '': { $port = '--port=4730' }
        default: { $port = "--port=${gearman_port}" }
    }

    case $gearman_listen {
        '': { $listen = '--listen=0.0.0.0' }
        default: { $listen = "--listen=${gearman_listen}" }
    }

    case $gearman_threads {
        '': { $threads = '--threads=4' }
        default: { $threads = "--threads=${gearman_threads}" }
    }
}