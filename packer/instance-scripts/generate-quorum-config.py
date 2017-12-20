import argparse
import json

def parse_args():
    """
    Parses command line args

    Returns:
        The argparse namespace
    """
    parser = argparse.ArgumentParser(description="Generates a quorum config once addresses have been retrieved from vault")
    parser.add_argument('--makers', dest='makers', required=True, nargs='*', help="A list of addresses for maker nodes")
    parser.add_argument('--validators', dest='validators', required=True, nargs='*', help="A list of addresses for validator nodes")
    parser.add_argument('--vote-threshold', dest='vote_threshold', required=True, type=int, help="The number of votes required to confirm a block")
    parser.add_argument('--out-file', dest='out_file', default='/opt/quorum/private/quorum-config.json', help="The command line output of 'vault read -format=json quorum/makers'")
    return parser.parse_args()

def main():
    args = parse_args()

    output = {"threshold": args.vote_threshold, "voters": args.validators, "makers": args.makers}

    with open(args.out_file, 'w') as out_file:
        json.dump(output, out_file, indent=2, separators=(',', ': '))

if __name__ == '__main__':
    main()
