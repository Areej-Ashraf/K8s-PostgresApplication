namespace :docker do
    desc "Push docker images to DockerHub"
    task :push_image do
      TAG = `git rev-parse --short HEAD`.strip
  
      puts "Building Docker image"
      sh "docker build -t areejashraf/dockerproject02_web:latest ."
  
      IMAGE_ID = `docker images | grep areejashraf\/dockerproject02_web | head -n1 | awk '{print $3}'`.strip
  
      puts "Tagging latest image"
      sh "docker tag #{IMAGE_ID} areejashraf/dockerproject02_web:latest"
  
      puts "Pushing Docker image"
      sh "docker push areejashraf/dockerproject02_web:latest"
      sh "docker push areejashraf/dockerproject02_web:latest"
  
      puts "Done"
    end
  
  end