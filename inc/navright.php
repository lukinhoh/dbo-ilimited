                <div class="col-sm">
                    <table class="table table-hover table-dark">
                        <thead>
                            <th class="text-center" scope="col">Servidor</th>
                        </thead>
                        <thead>
                            <tr>
                                <?php $consultar_onlines = pegar_chars_on(); if($consultar_onlines['all_online'] >= 1){?>
                                    <td>Servidor Status: <a class="text-success">Online</a></td>
                                <?php } else {?>
                                    <td>Servidor Status: <a class="text-danger">Offline</a></td>
                                <?php } ?>
                            </tr>
                            <tr>
                                <?php $consultar_onlines = pegar_chars_on(); if($consultar_onlines['all_online'] >= 1){?>
                                    <td>Jogadores Online: <a class="text-success"><?php echo $consultar_onlines['all_online']; ?></a></td>
                                <?php } else {?>
                                    <td>Jogadores Online: <a class="text-danger"><?php echo $consultar_onlines['all_online']; ?></a></td>
                                <?php } ?>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </main>
</div>