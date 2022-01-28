import { GetStaticProps, GetStaticPaths } from "next";
const BASE_URL = "http://localhost:8000/jobs/api";

export const getStaticPaths: GetStaticPaths = async (_) => {
  const res = await fetch(`${BASE_URL}/posts/`);
  const json: JobPost[] = await res.json();
  const paths = json.map((post) => {
    return { params: { id: String(post.id) } };
  });
  return {
    paths,
    fallback: false,
  };
};

export const getStaticProps: GetStaticProps = async ({ params }) => {
  const id = params?.id;
  const res = await fetch(`${BASE_URL}/posts/${id}`);
  if (!res.ok) {
    return {
      notFound: true,
    };
  }
  const json: JobPost = await res.json();
  const { title, body, created_at, status } = json;
  return { props: { title, body, created_at, status } };
};

enum JobPostStatus {
  Published = "PUBLISHED",
  Unpublished = "UNPUBLISHED",
}
type JobPost = {
  title: string;
  body: string;
  created_at: string;
  status: JobPostStatus;
  id: number;
};

const JobPost = ({ title, body, created_at }: JobPost) => {
  return (
    <div>
      <header>
        <h1>{title} </h1>
        <span>Published on: {created_at}</span>
      </header>
      <div>
        <p>{body}</p>
      </div>
    </div>
  );
};
export default JobPost;
