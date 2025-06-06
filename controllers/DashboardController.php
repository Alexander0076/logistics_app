<?php
  class DashboardController extends Controller {
      private $deliveryModel;
      private $driverModel;
      private $packageModel;
      private $accessControlModel;
      private $routeModel;
      private $fuelAnalysisModel;
      private $reportAnalysisModel;

      public function __construct() {
          if (!isset($_SESSION['user_id'])) {
              header('Location: ' . BASE_URL . 'AuthController');
          }
          $this->deliveryModel = $this->loadModel('Delivery');
          $this->driverModel = $this->loadModel('Driver');
          $this->packageModel = $this->loadModel('Package');
          $this->accessControlModel = $this->loadModel('AccessControl');
          $this->routeModel = $this->loadModel('Route');
          $this->fuelAnalysisModel = $this->loadModel('FuelAnalysis');
          $this->reportAnalysisModel = $this->loadModel('ReportAnalysis');
      }

      public function index() {
          $data['deliveries'] = $this->deliveryModel->getAll();
          $this->view('dashboard/entregas', $data);
      }

      public function conductores() {
          $data['drivers'] = $this->driverModel->getAll();
          $this->view('dashboard/conductores', $data);
      }

      public function paquetes() {
          $data['on_site_packages'] = $this->packageModel->getByStatus('on_site');
          $data['in_transit_packages'] = $this->packageModel->getByStatus('in_transit');
          $this->view('dashboard/paquetes', $data);
      }

      public function control() {
          if ($_SERVER['REQUEST_METHOD'] == 'POST') {
              $driver_id = $_POST['driver_id'];
              if (isset($_POST['add_entry'])) {
                  $this->accessControlModel->addEntry($driver_id);
              } elseif (isset($_POST['add_exit'])) {
                  $this->accessControlModel->addExit($driver_id);
              }
          }
          $data['access_logs'] = $this->accessControlModel->getAll();
          $this->view('dashboard/control', $data);
      }

      public function rutas() {
          $data['routes'] = $this->routeModel->getAll();
          $this->view('dashboard/rutas', $data);
      }

      public function combustible() {
          $data['fuel_data'] = $this->fuelAnalysisModel->getAll();
          $this->view('dashboard/combustible', $data);
      }

      public function unidades() {
          $data['units'] = $this->deliveryModel->getAllUnits();
          $this->view('dashboard/unidades', $data);
      }

      public function reportes() {
          $data['reports'] = $this->reportAnalysisModel->getAll();
          $this->view('dashboard/reportes', $data);
      }
  }