@extends('dashboard.layouts.main')
@section('container')
    <div class="container">
        <div class="row my-3">
            <div class="col-lg-8">
                <h2>{{ $post->title }}</h2>
                <a href="/dashboard/posts" class="btn btn-primary mt-1"><span data-feather="chevron-left"></span> back to my
                    post</a>
                <a href="/dashboard/posts/{{ $post->slug }}/edit" class="btn btn-success mt-1"><span
                        data-feather="edit"></span>Edit</a>
                <form action="/dashboard/posts/{{ $post->slug }}" method="post" class="d-inline">
                    @method('delete')
                    @csrf
                    <button class="btn btn-danger mt-1" onclick="return confirm('Are you sure want to delete this?')"><span
                            data-feather="delete"></span>
                        Delete</button>
                </form>
                @if ($post->image)
                    <div style="max-height: 450px; overflow: hidden">
                        <img src="{{ asset('storage/' . $post->image) }}" class="img-fluid mt-3">
                    </div>
                @else
                    <img src="https://source.unsplash.com/1200x400?{{ $post->category->name }}" class="img-fluid mt-3">
                @endif
                <article class="my-3 fs-6">
                    {!! $post->body !!}
                </article>
                <a href="/posts">Back to Posts</a>
            </div>
        </div>
    </div>
@endsection
