@extends('layouts.main')
@section('container')
    <div class="row justify-content-center p-5">
        <div class="col-lg-7">
            <div class="card mt-4 border-success">
                <div class="card-header border-success">
                    <h5 class="card-title fs-2 text-center">About Me</h5>
                </div>
                <div class="row g-0">
                    <div class="col-sm-5">
                        <img src="img/{{ $image }}" class="rounded-circle p-3">
                    </div>
                    <div class="col-sm-7">
                        <div class="card-body my-2">
                            <p class="card-text fs-3 fw-bold">{{ $name }}</p>
                            <hr class="text-success">
                            <p class="card-text fst-italic text-primary">{{ $profesi[0] }} - {{ $profesi[1] }}</p>
                            <p class="card-text"><small class="text-muted">{{ $email }}</small></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
