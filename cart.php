<?php
require('header.php');
?>

<div class="ht__bradcaump__area" style="background: rgba(0, 0, 0, 0) url(images/bg/WhatsAppImage2024-07-10at08.46.53_a2229776.jpg) no-repeat scroll center center / cover ;">
            <div class="ht__bradcaump__wrap">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="bradcaump__inner">
                                <nav class="bradcaump-inner">
                                  <a class="breadcrumb-item" href="index.html">Home</a>
                                  <span class="brd-separetor"><i class="zmdi zmdi-chevron-right"></i></span>
                                  <span class="breadcrumb-item active">shopping cart</span>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Bradcaump area -->
        <!-- cart-main-area start -->
        <div class="cart-main-area ptb--100 bg__white">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <form action="#">               
                            <div class="table-content table-responsive">
                                <table>
                                    <thead>
                                        <tr>
                                            <th class="product-thumbnail">products</th>
                                            <th class="product-name">name of products</th>
                                            <th class="product-price">Price</th>
                                            <th class="product-quantity">Quantity</th>
                                            <th class="product-subtotal">Total</th>
                                            <th class="product-remove">Remove</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                            <?php
                                            if (isset($_SESSION['cart']) && is_array($_SESSION['cart'])) {
                                                foreach ($_SESSION['cart'] as $key => $val) {
                                                    $productArr = get_product($con, '', '', $key);
                                                    $pname = $productArr[0]['name'];
                                                    $mrp = $productArr[0]['mrp'];
                                                    $price = $productArr[0]['price'];
                                                    $image = $productArr[0]['image'];
                                                    $qty = $val['qty'];
                                                ?>
                                                    <tr>
                                                        <td class="product-thumbnail"><a href="#"><img src="<?php echo 'admin/media/product/' . $image ?>" alt="product img" /></a></td>
                                                        <td class="product-name"><a href="#"><?php echo $pname ?></a>
                                                            <ul class="pro__prize">
                                                                <li class="old__prize"><?php echo $mrp ?></li>
                                                                <li><?php echo $price ?></li>
                                                            </ul>
                                                        </td>
                                                        <td class="product-price"><span class="amount"><?php echo $price ?></span></td>
                                                        <td class="product-quantity"><input type="number" id="<?php echo $key ?>qty" value="<?php echo $qty ?>" />
                                                            <br />
                                                            <a href="javascript:void(0)" onclick="manage_cart('<?php echo $key ?>','update')">update</a>
                                                        </td>
                                                        <td class="product-subtotal"><?php echo (float)$qty * (float)$price ?></td>
                                                        <td class="product-remove"><a href="javascript:void(0)" onclick="manage_cart('<?php echo $key ?>','remove')"><i class="icon-trash icons"></i></a></td>
                                                    </tr>
                                            <?php
                                                }
                                            } else {
                                                echo "<tr><td colspan='6'>Your cart is empty.</td></tr>";
                                            }
                                            ?>
                                        </tbody>
                                </table>
                            </div>
                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="buttons-cart--inner">
                                        <div class="buttons-cart">
                                            <a href="<?php echo "index.php"?>">Continue Shopping</a>
                                        </div>
                                        <div class="buttons-cart checkout--btn">
                                            
                                            <a href="<?php echo "checkout.php"?>">checkout</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form> 
                    </div>
                </div>
            </div>
        </div>

<?php 

require('footer.php');

?>