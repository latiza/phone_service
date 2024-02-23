<?php

// database/migrations/xxxx_xx_xx_xxxxxx_drop_phone_models_table.php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class DropPhoneModelsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::dropIfExists('phone_models');
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        // Visszavonás esetén szükség lehet a tábla újbóli létrehozására.
        // Itt hozzáadhatod a tábla létrehozására szolgáló kódot.
    }
}
