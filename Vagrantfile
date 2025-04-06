Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"
  config.vm.network "public_network", bridge: "wlo1: Wi-Fi (Wireless)"
  # Адаптер 2: Приватная сеть 2 (192.168.57.0)
  config.vm.network "private_network", ip: "192.168.57.111"
  # Первонвчальная конфигурация с созданием польователя и добавлением ключей авторизации
  config.vm.provision "shell", path: "presetup-machine.bash"
end
