@extends('layouts.main')
@section('container')
    <div class="container">
        <div class="row justify-content-center mb-5">
            <div class="col-md-8">
                <h2>{{ $post->title }}</h2>
                <p class="text-success">By : <a href="/posts?author={{ $post->author->username }}"
                        class="text-decoration-none">{{ $post->author->name }}</a> in <a
                        href="/posts?category={{ $post->category->slug }}"
                        class="text-decoration-none">{{ $post->category->name }}</a></p>
                @if ($post->image)
                    <div style="max-width:1200px; max-height: 400px; overflow: hidden">
                        <img src="{{ asset('storage/' . $post->image) }}" class="card-img-top">
                    </div>
                @else
                    <img src="https://source.unsplash.com/1200x400?{{ $post->category->name }}" class="img-fluid">
                @endif
                <article class="my-3 fs-6">
                    {!! $post->body !!}
                </article>
                <a href="/posts">Back to Posts</a>
            </div>
        </div>
    </div>
@endsection
