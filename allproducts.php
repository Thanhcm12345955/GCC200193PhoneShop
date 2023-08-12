<?php
require_once('header.php');
require_once('connect.php');

$sql = "SELECT * FROM `product`";
    $c = new Connect();
    $dblink = $c->connectToMySQL();
    $re = $dblink->query($sql);
    if($re->num_rows>0){
        ?>
        <div class = "container">
            <div class = "row justify-content-center">
        <?php
        while($row=$re->fetch_assoc()){
           ?>


  <div class="col-md-3 py-2">
      <div class="card text-black">
            <img src="./img/<?=$row['pimage']?>"
              class="card-img-top" alt="iPhone" />
            <div class="card-body">
              <div class="text-center mt-1">
                <h4 class="card-title">
                  <a href="detail.php?id=<?=$row['pid']?>">
                      <?=$row['pname']?>
                  </a>
                </h4>
                  <div class="d-grid gap-2 my-4">
                  <h6 class="text-primary mb-1 pb-3"><?=$row['pprice']?></h6>
                  </div>
              </div>
  
              <div class="d-flex flex-row">
                <button type="button" class="btn btn-primary flex-fill me-1" data-mdb-ripple-color="dark">
                  Learn more
                </button>
                <a href="cart.php?id=<?=$row['pid']?>" class="btn btn-danger flex-fill ms-1">Buy now</a>
              </div>
            </div>
        </div>
  </div>

      <?php
        }
    ?>
            </div>
        </div>
    <?php
    }else{
        echo "Something wrong!!!!";
    }
?>