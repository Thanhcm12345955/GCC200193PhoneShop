<?php
include_once("header.php");
include_once("connect.php");
$c = new Connect();
$dblink = $c->connectToPDO();
if(isset($_COOKIE['cc_username'])){
if(isset($_GET['id']))
{
    $pid = $_GET['id'];
    $findsql = "SELECT `cproid` FROM `cart` WHERE `cproid` = ? and `cuserid` = ?";
    $re = $dblink->prepare($findsql);
    $valueArray = [$pid,1];
    $stmt = $re->execute($valueArray);
    if($re->rowCount() == 0){
    $sql = "INSERT INTO `cart`(`cuserid`, `cproid`, `cquantity`, `cdate`) VALUES (?,?,1,CURDATE())";
    }eLSe{
        $sql = "UPDATE `cart` SET `cquantity`= `cquantity` + 1,`cdate`= CURDATE() WHERE `cuserid`= ? 
        and `cproid` = ?";
    }
    $re1 = $dblink->prepare($sql);
    $valueArray1 = [1,$pid];
    $stmt = $re1->execute($valueArray1);
}
    $showCartSQL = "SELECT `pimage`,`pname`,`cquantity`,`pprice` FROM `cart` c, `product` p WHERE c.cproid = p.pid and `cuserid` = ?";
    $re = $dblink->prepare($showCartSQL);
    $valueArray1 = [1];
    $re->execute($valueArray1);
    $rows = $re->fetchAll(PDO::FETCH_BOTH);
  }
  else{
      header("Location: login.php");
    }
?>
<section class="h-10;">
  <div class="container h-10 py-5">
    <div class="row d-flex justify-content-center align-items-center h-10">
      <div class="col-10">
        <div class="d-flex justify-content-between align-items-center mb-4">
          <h3 class="fw-normal mb-0 text-black">Shopping Cart</h3>
        </div>
        <?php
        foreach($rows as $row){}
        ?>
        <div class="card rounded-3 mb-4">
          <div class="card-body p-4">
            <div class="row d-flex justify-content-between align-items-center">
              <div class="col-md-2 col-lg-2 col-xl-2">
              <img src="./img/<?=$row['pimage']?>"
                  class="img-fluid rounded-3" alt="Cotton T-shirt">
              </div>
              <div class="col-md-3 col-lg-3 col-xl-3">
                <p class="lead fw-normal mb-2"> <?=$row['pname'] ?></p>
              </div>
              <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                <button class="btn btn-link px-2"
                  onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                  <i class="fas fa-minus"></i>
                </button>

                <input id="form1" min="0" name="<?=$row['cquantity'] ?> quantity" value="2" type="number"
                  class="form-control form-control-sm" />

                <button class="btn btn-link px-2"
                  onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                  <i class="fas fa-plus"></i>
                </button>
              </div>
              <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                <h5 class="mb-0">$ <?=$row['pprice'] ?></h5>
              </div>
              <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                <a href="#!" class="text-danger"><i class="fas fa-trash fa-lg"></i></a>
              </div>
            </div>
          </div>
        </div>
        <div class="card mb-4">
        <div class="card-body d-grid mx-auto col-5">
          <button type="button" class="btn btn-secondary" disabled>total</button>
          </div>
        </div>

        <div class="card">
          <div class="card-body">
            <a href="allproducts.php" class="btn btn-danger flex-fill ms-1">Continue Shopping</a>
          </div>
        </div>

      </div>
    </div>
  </div>
</section>