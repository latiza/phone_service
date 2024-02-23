*starter kit
*A következő parancs segítségével létrehozhatsz egy új migrációs fájlt:

php artisan make:migration create_brands_table

Ez a parancs egy új migrációs fájlt hoz létre a database/migrations könyvtárban.

Migrációs fájl szerkesztése:
Nyisd meg a létrehozott migrációs fájlt (pl. database/migrations/xxxx_xx_xx_create_brands_table.php) egy szövegszerkesztőben, és szerkeszd a up metódust az alábbiak szerint:


<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBrandsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('brand', function (Blueprint $table) {
            $table->id('brand_id');
            $table->string('brand_name', 20)->nullable();
            $table->string('brand_image', 255)->nullable();
            $table->timestamps(); // created_at és updated_at mezők hozzáadása
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('brand');
    }
}
A up metódus tartalmazza a tábla létrehozását, és a down metódus a visszavonás szabályait.

Migráció végrehajtása:
A migrációt a következő paranccsal hajthatod végre:

php artisan migrate

Létrehozol egy Seed fájlt:
Első lépésként hozz létre egy Seeder fájlt. Laravelben a php artisan make:seeder parancsot használhatod erre. Például:

php artisan make:seeder BrandSeeder
Ez létrehoz egy BrandSeeder.php fájlt a database/seeders mappában.

Módosítod a Seeder fájlt:
Nyisd meg a BrandSeeder.php fájlt, és módosítsd a run metódust az adatok hozzáadásával:


// database/seeders/BrandSeeder.php

use Illuminate\Database\Seeder;

class BrandSeeder extends Seeder
{
    public function run()
    {
        DB::table('brand')->insert([
            [
                'brand_id' => 1,
                'brand_name' => 'Apple',
                'brand_image' => 'apple.jpg',
            ],
            // Itt a többi adatsor...
        ]);
    }
}
Futtatod a Seedert:
Futtasd a db:seed parancsot, hogy végrehajtsd a Seeder-t:

php artisan db:seed --class=BrandSeeder

ezzel feltöltésre kerül az adatbázisba

Következő tábla:
php artisan make:migration create_phonemodel_table

migrációs fájlban át kell írni: 
public function up()
    {
        Schema::create('phonemodel', function (Blueprint $table) {
            $table->id('phonemodel_id');
            $table->string('phonemodel_name', 15)->nullable();
            $table->unsignedBigInteger('brand_id')->nullable();
            $table->foreign('brand_id')->references('brand_id')->on('brand')->onDelete('cascade');
            $table->timestamps();
        });
    }

    php artisan migrate

 databaseseed run metódusának javítása 
    use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    public function run()
    {
        // Brand adatok beszúrása
        DB::table('brand')->insert([
            ['brand_id' => 1, 'brand_name' => 'Apple', 'brand_image' => 'apple.jpg'],
            ['brand_id' => 2, 'brand_name' => 'Xiaomi', 'brand_image' => 'xiaomi.jpg'],
            ['brand_id' => 3, 'brand_name' => 'Samsung', 'brand_image' => 'samsung.jpg'],
            ['brand_id' => 4, 'brand_name' => 'Huawei', 'brand_image' => 'huawei.jpg'],
            ['brand_id' => 5, 'brand_name' => 'Nokia', 'brand_image' => 'nokia.jpg'],
            ['brand_id' => 6, 'brand_name' => 'OnePlus', 'brand_image' => 'oneplus.jpg'],
            ['brand_id' => 7, 'brand_name' => 'Sony', 'brand_image' => 'sony.jpg'],
            ['brand_id' => 8, 'brand_name' => 'LG', 'brand_image' => 'lg.jpg'],
            ['brand_id' => 9, 'brand_name' => 'Lenovo', 'brand_image' => 'lenovo.jpg'],
            ['brand_id' => 10, 'brand_name' => 'Pixel', 'brand_image' => 'pixel.jpg'],
        ]);

        // Phonemodel adatok beszúrása
        DB::table('phonemodel')->insert([
            ['phonemodel_id' => 1, 'phonemodel_name' => '14', 'brand_id' => 1],
            ['phonemodel_id' => 2, 'phonemodel_name' => 'SE', 'brand_id' => 1],
            ['phonemodel_id' => 3, 'phonemodel_name' => 'Redmi', 'brand_id' => 2],
            ['phonemodel_id' => 4, 'phonemodel_name' => 'MI', 'brand_id' => 2],
            ['phonemodel_id' => 5, 'phonemodel_name' => 'Galaxy A', 'brand_id' => 3],
            ['phonemodel_id' => 6, 'phonemodel_name' => 'Galaxy S', 'brand_id' => 3],
            ['phonemodel_id' => 7, 'phonemodel_name' => 'P', 'brand_id' => 4],
            ['phonemodel_id' => 8, 'phonemodel_name' => 'Mate', 'brand_id' => 4],
            ['phonemodel_id' => 9, 'phonemodel_name' => '5.1', 'brand_id' => 5],
            ['phonemodel_id' => 10, 'phonemodel_name' => '6.1', 'brand_id' => 5],
            ['phonemodel_id' => 11, 'phonemodel_name' => '10', 'brand_id' => 6],
            ['phonemodel_id' => 12, 'phonemodel_name' => '9', 'brand_id' => 6],
            ['phonemodel_id' => 13, 'phonemodel_name' => 'Xperia Z', 'brand_id' => 7],
            ['phonemodel_id' => 14, 'phonemodel_name' => 'Xperia XA', 'brand_id' => 7],
            ['phonemodel_id' => 15, 'phonemodel_name' => 'K50', 'brand_id' => 8],
            ['phonemodel_id' => 16, 'phonemodel_name' => 'G', 'brand_id' => 8],
            ['phonemodel_id' => 17, 'phonemodel_name' => 'Vibe', 'brand_id' => 9],
            ['phonemodel_id' => 18, 'phonemodel_name' => 'A', 'brand_id' => 9],
            ['phonemodel_id' => 19, 'phonemodel_name' => '3', 'brand_id' => 10],
            ['phonemodel_id' => 20, 'phonemodel_name' => '4', 'brand_id' => 10],
        ]);
    }
}
php artisan db:seed
ha erre hibát ad : 
php artisan migrate:reset
php artisan migrate
php artisan db:seed
 ellenőrizd az adatbázisban betöltődtek e az adatok

 most jöhet a part: 
 php artisan make:migration create_parts_table

migrációs fájl javítása: 
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePartsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('parts', function (Blueprint $table) {
            $table->id('part_id');
            $table->string('part_name', 35)->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('parts');
    }
}
php artisan migrate
adatok beszúrása:
php artisan make:seeder PartSeeder
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PartSeeder extends Seeder

partseeder javítása: 
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('parts')->insert([
            ['part_id' => 1, 'part_name' => 'akkumulátor'],
            ['part_id' => 2, 'part_name' => 'kijelző'],
            ['part_id' => 3, 'part_name' => 'töltőcsatlakozó'],
            ['part_id' => 4, 'part_name' => 'bekapcsoló gomb'],
            ['part_id' => 5, 'part_name' => 'hangerő gomb'],
            ['part_id' => 6, 'part_name' => 'hátlapi kamera'],
            ['part_id' => 7, 'part_name' => 'kamera lencse'],
            ['part_id' => 8, 'part_name' => 'hangszóró'],
            ['part_id' => 9, 'part_name' => 'szoftveres javítás'],
        ]);
    }
}

php artisan db:seed --class=PartSeeder

következő tábla létrehozása: 
php artisan make:migration create_typepart_table

public function up()
    {
        Schema::create('typepart', function (Blueprint $table) {
             $table->bigIncrements('type_part_id'); 
            $table->string('type_part_name')->nullable();
            $table->time('repair')->nullable();
            $table->integer('type_id')->nullable();
            $table->integer('part_id')->nullable();
            $table->integer('price')->nullable();
            
            // Az alábbi két sorral beállítjuk az indexeket a 'type_id' és 'part_id' oszlopokra
            $table->index('type_id');
            $table->index('part_id');

            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('typepart');
    }

php artisan migrate

php artisan make:seeder TypePartSeeder

ide inkább beimportáltam a fájlból az adatokat mert túl sok volt

következő tábla: 
php artisan make:migration create_type_phone_table
 public function up()
    {
        Schema::create('type_phone', function (Blueprint $table) {
            $table->integer('type_id')->primary(); // 'type_id' mint azonosító
            $table->string('type_name', 15)->nullable();
            $table->integer('phonemodel_id')->nullable();
            $table->string('type_image')->nullable();
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('type_phone');
    }
    minden adatbázis a helyén

Controller készítése: 
php artisan make:controller PhoneController
<?php

namespace App\Http\Controllers;

use App\Models\Brand;
use Illuminate\Http\Request;

class PhoneController extends Controller
{
    public function index()
    {
        $brands = Brand::with('models')->get();

        return view('phones.index', compact('brands'));
    }
}

modellek létrehozása: 
php artisan make:model Brand -m
php artisan make:model PhoneModel -m

app/models/brand.php
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Brand extends Model
{
    public function models()
    {
        return $this->hasMany(PhoneModel::class);
    }
}
phonemodel.php tartalma: 
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PhoneModel extends Model
{
    public function brand()
    {
        return $this->belongsTo(Brand::class);
    }
}
weboldal létrehozása: 
php artisan make:view phones.index
<!DOCTYPE html>
<html>
<head>
    <title>Telefonok</title>
</head>
<body>

<h1>Telefonok</h1>

@foreach($brands as $brand)
    <h2>{{ $brand->name }}</h2>

    <ul>
        @foreach($brand->models as $model)
            <li>{{ $model->name }}</li>
        @endforeach
    </ul>
@endforeach

</body>
</html>
 route: 
 // routes/web.php

use App\Http\Controllers\PhoneController;

Route::get('/', [PhoneController::class, 'index']);

php artisan make:controller PhoneController

// app/Brand.php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Brand extends Model
{
    protected $table = 'brand';

    public function phoneModels()
    {
        return $this->hasMany(PhoneModel::class, 'brand_id');
    }
}
php artisan make:controller BrandController

// app/Http/Controllers/BrandController.php

namespace App\Http\Controllers;

use App\Brand;
use Illuminate\Http\Request;

class BrandController extends Controller
{
    public function index()
    {
        $brands = Brand::with('phoneModels')->get();

        return view('phones.index', compact('brands'));
    }
}

composer dump-autoload
php artisan optimize


