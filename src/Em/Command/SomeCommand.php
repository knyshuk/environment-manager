<?php

namespace Em\Command;

use Em\Service\ConfigManager;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Output\OutputInterface;

class SomeCommand extends Command {

  /**
   * @var \Em\Service\ConfigManager $configManager
   */
  protected $configManager;

  /**
   * Constructor
   *
   * @param \Em\Service\ConfigManager $config_manager
   */
  public function __construct(ConfigManager $config_manager) {
    $this->configManager = $config_manager;
    parent::__construct();
  }

  /**
   * {@inheritDoc}
   */
  protected function configure() {
    $this->setDescription('someone');
  }

  /**
   * {@inheritDoc}
   */
  protected function execute(InputInterface $input, OutputInterface $output) {
    $output->writeln('Some');
  }
}
