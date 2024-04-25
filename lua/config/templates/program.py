import argparse


def main(args):
    global v_print
    noop = lambda _: None
    v_print = print if args.verbose else noop


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="""""")
    parser.add_argument("-o", "--out-prefix", help="output prefix", type=str, required=False, default="")
    parser.add_argument("--verbose", help="Enable verbose logging", required=False, default=False, action="store_true")
    args = parser.parse_args()

    main(args)
