#!/bin/sh

if [ ! -f buildstep ]; then
    echo "0">buildstep
    
    echo "\n-----------------------------"
    echo "HowTo: run build requersively to reach buildstep 4"
    echo "-----------------------------\n" 
fi

if [ $(<buildstep) = "0" ]; then
    echo "\n-----------------------------------------------"
    echo "$(<buildstep). Getting Started"
    echo "-----------------------------------------------\n" 
    #Start with a initial .Dockerfile without npm-shrinkwrap.json and "npm install"
    docker build -t myapp -f Dockerfile.init .
    docker-compose  -f docker-compose.init.yml run --rm myapp /bin/bash init.sh
    echo "\n-----------------------------------------------"
    echo "Getting Started is ready (End of buildstep: $(<buildstep))"
    echo "-----------------------------------------------\n" 

    echo "1">buildstep
elif [ $(<buildstep) = "1" ]; then
  echo "\n-----------------------------------------------"
    echo "$(<buildstep). Installing Dependencies"
    echo "-----------------------------------------------\n" 
    docker build -t myapp -f Dockerfile.install .
    docker-compose -f docker-compose.init.yml  build
    echo "\n-----------------------------------------------"
    echo "Installing Dependencies is ready (End of buildstep: $(<buildstep))"
    echo "-----------------------------------------------\n" 

    echo "2">buildstep
elif [ $(<buildstep) = "2" ]; then
  echo "\n-----------------------------------------------"
    echo "$(<buildstep). Package Installation and Shrinkwrap"
    echo "-----------------------------------------------\n" 
    docker-compose -f docker-compose.install.yml  run --rm myapp /bin/bash install.sh
    docker-compose -f docker-compose.install.yml build
    echo "\n-----------------------------------------------"
    echo "Package Installation and Shrinkwrap (End of buildstep: $(<buildstep))"
    echo "-----------------------------------------------\n" 

    echo "3">buildstep
elif [ $(<buildstep) = "3" ]; then
  echo "\n-----------------------------------------------"
    echo "$(<buildstep). Running the App:"
    echo "-----------------------------------------------\n" 
    docker-compose -f docker-compose.yml up &
    sleep 10s
    docker-compose -f docker-compose.yml down
    echo "\n-----------------------------------------------"
    echo "App is running (End of buildstep: $(<buildstep))"
    echo "-----------------------------------------------\n" 

    echo "4">buildstep
elif [ $(<buildstep) = "4" ]; then
    echo "\n-----------------------------------------------"
    echo "$(<buildstep). Build the App [production]:"
    echo "-----------------------------------------------\n" 
    docker-compose -f docker-compose.prod.yml build    
    docker-compose -f docker-compose.prod.yml up &
    echo "\n- - - - - - - - - - - - - - - - - - - - - - - -"
    echo "App is running [production mode] (End of buildstep: $(<buildstep))"
    echo "- - - - - - - - - - - - - - - - - - - - - - - -\n" 
    sleep 10s
    docker-compose -f docker-compose.prod.yml down
    echo "\n-----------------------------------------------"
    echo "App is down [production mode] (End of buildstep: $(<buildstep))"
    echo "-----------------------------------------------\n" 
    
    echo "5">buildstep
elif [ $(<buildstep) = "5" ]; then
    echo "\n-----------------------------------------------"
    echo "$(<buildstep). Build the App [development]:"
    echo "-----------------------------------------------\n" 
    #docker-compose -f docker-compose.dev.yml  run --rm myapp /bin/bash dev.sh
    docker-compose -f docker-compose.dev.yml build
    docker-compose -f docker-compose.dev.yml up &
    echo "\n- - - - - - - - - - - - - - - - - - - - - - - -"
    echo "App running [development mode] (End of buildstep: $(<buildstep))"
    echo "- - - - - - - - - - - - - - - - - - - - - - - -\n" 
    sleep 10s   
    docker-compose -f docker-compose.dev.yml down
    echo "\n- - - - - - - - - - - - - - - - - - - - - - - -"
    echo "App testing [development mode] (End of buildstep: $(<buildstep))"
    echo "- - - - - - - - - - - - - - - - - - - - - - - -\n" 
    docker-compose run --rm myapp /bin/bash -c 'npm --silent test'
    echo "\n- - - - - - - - - - - - - - - - - - - - - - - -"
    echo "App testing ends [development mode] (End of buildstep: $(<buildstep))"
    echo "- - - - - - - - - - - - - - - - - - - - - - - -\n\n" 
  
    echo "\n-----------------------------------------------"
    echo "App is down  [development mode] (End of buildstep: $(<buildstep))"
    echo "-----------------------------------------------\n" 
fi




    
 
 


#docker build -t myapp -f Dockerfile.install .
#docker-compose -f docker-compose.install.yml  run --rm myapp /bin/bash install.sh

#docker build -t myapp -f Dockerfile .

##docker-compose build

#docker build -t myapp .

